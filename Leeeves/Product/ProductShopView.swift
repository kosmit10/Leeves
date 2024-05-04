//
//  ProductShopView.swift
//  Leeeves
//
//  Created by maciura on 04/05/2024.
//

import SwiftUI

struct ProductShopView: View {
    @State private var productDetail: ProductDetail?
    @State private var isDescriptionVisible = false
    @State private var isShipVisible = false

    @State private var isLoading = true
    @Environment(\.presentationMode) var presentationMode
    let colorJasny = Color(red: 238/255, green: 228/255, blue: 192/255)
    var product: Product
    
    var body: some View {
        NavigationView{
            ZStack{
                colorJasny
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .foregroundStyle(
                        .linearGradient(colors: [
                            Color(red: 16/255, green: 71/255, blue: 52/255),
                            Color(red: 50/255, green: 70/255, blue: 10/255)
                        ], startPoint: .topLeading, endPoint: .bottomLeading)
                    )
                VStack{
                    AppBar()
                    ScrollView{
                    VStack{
                        if isLoading {
                            ProgressView("")
                                .scaleEffect(1.5)
                                .offset(y: UIScreen.main.bounds.height * 0.25)
                                .progressViewStyle(CircularProgressViewStyle(tint: colorJasny))
                        } else if let productDetail = productDetail {
                            if let firstImageUrl = productDetail.galleryImages.first {
                                AsyncImage(url: firstImageUrl) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 300, height: 300)
                                }
                                .cornerRadius(10)
                                .padding()
                            }
            
                            Text(productDetail.title)
                                .foregroundColor(Color(colorJasny))
                                .multilineTextAlignment(.center)
                                .font(.title3)
                                .padding(.bottom)
                            if let salePrice = product.salePrice, !salePrice.isEmpty {
                                HStack{
                                    Text(productDetail.regularPrice ?? "")
                                        .strikethrough()
                                        .foregroundColor(Color.gray)
                                        .font(.title3)
                                    Text("\(salePrice),00zł")
                                        .foregroundColor(Color(colorJasny))
                                }
                                .padding(.top, -10.0)
                            } else {
                                Text("Price: \(productDetail.regularPrice ?? "")")
                            }
                            Text(productDetail.previousLowestPrice ?? "")
                                .font(.footnote)
                                .foregroundColor(Color(colorJasny))
                                .padding(.top, -10.0)
                            
                            if productDetail.sizes.isEmpty {
                                Text("ONE SIZE")
                                    .padding()
                                //                            DOKONCZYC!!
                            }
                            else {
                                HStack(spacing: 2) {
                                    ForEach(productDetail.sizes, id: \.self) {size in
                                        Text(size)
                                            .padding()
                                            .background(Color(colorJasny))
                                            .foregroundColor(.black)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .frame(width: 50, height: 30)
                                            .font(.system(size: 10))
                                        
                                    }
                                }
                                .padding()
                            }
                            HStack{
                                VStack{
                                    Button(action: {
                                        self.isDescriptionVisible.toggle()
                                    }) {
                                        HStack {
                                            Text("DESCRIPTION")
                                            Image(systemName: "arrow.up.and.line.horizontal.and.arrow.down")
                                        }
                                    }
                                    .padding(.top, -45.0)
                                    .foregroundColor(Color(colorJasny))
                                    .font(.system(size: 20))
                                    if isDescriptionVisible {
                                        Text(productDetail.description)
                                            .padding()
                                            .foregroundColor(Color(colorJasny))
                                            .font(.footnote)
                                    }
                                    
                                }
                                Spacer()
                                VStack{
                                Button(action: {
                                    self.isShipVisible.toggle()
                                }) {
                                    HStack {
                                        Text("SHIP")
                                        Image(systemName: "shippingbox")
                                    }
                                }
                                .padding(.top, -45.0)
                                .foregroundColor(Color(colorJasny))
                                .font(.system(size: 20))
                                if isShipVisible {
                                    Text(productDetail.shippingInfo)
                                        .padding()
                                        .foregroundColor(Color(colorJasny))
                                        .font(.footnote)
                                    }
                                }
                            }
                            .padding(.all, 50.0)
                            Button(action: {}){
                                HStack{
                                    Text("BUY NOW")
                                    Image(systemName: "basket.fill")
                                }
                                .padding(.top, -20.0)
                                .foregroundColor(Color(colorJasny))
                                .font(.system(size: 25))
                            }
                        }
                    }
                    .padding()
                    Spacer()
                    .onAppear {
                        loadProductDetails()
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.top, -50.0)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 100 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )

    }
    
    private func loadProductDetails() {
        Task {
            do {
                let details = try await fetchProductDetails(from: product.url)
                DispatchQueue.main.async {
                    self.productDetail = details
                    self.isLoading = false
                }
            } catch {
                print("Error loading product details: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}
struct ProductShopView_Previews: PreviewProvider {
    static var previews: some View {
        ProductShopView(product: Product(url: "https://leeves.pl/shop/cardigan-chainstitch-light-green", imageUrl: "https://leeves.pl/wp-content/uploads/Cardigan-Chainstitch-light-green-2-300x300.png", title: "CARDIGAN CHAINSTITCH LIGHT GREEN", regularPrice: "449", salePrice: "249"))
    }
}


