//
//  koszule.swift
//  Leeeves
//
//  Created by maciura on 03/05/2024.
//

import SwiftUI

struct koszule: View {
    @Binding var products: [Product]
    @Binding var isLoading: Bool
    @Binding var errorMessage: String?
    @Binding var showAlert: Bool
    
    let colorJasny = Color(red: 238/255, green: 228/255, blue: 192/255)
    var corners : UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight]

    var body: some View {
        VStack{
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5, anchor: .center)
                    .offset(y: UIScreen.main.bounds.height * 0.25)
                    .progressViewStyle(CircularProgressViewStyle(tint: colorJasny))
                    .padding()
            } else {
                ForEach(products) { product in
                    Button(action: {}){
                        VStack {
                            AsyncImage(url: URL(string: product.imageUrl)) { image in
                                image
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .cornerRadius(10.0)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            }
                            Text(product.title)
                                .foregroundColor(colorJasny)
                                .font(.system(size: 20))
                            
                            HStack{
                                if let salePrice = product.salePrice,
                                   !salePrice.isEmpty{
                                    Text(product.regularPrice ?? "")
                                        .foregroundColor(Color(.gray))
                                        .strikethrough(true)
                                    Text(salePrice)
                                        .foregroundColor(colorJasny)
                                } else {
                                    Text(product.regularPrice ?? "")
                                        .font(.subheadline)
                                }
                            }
                        }
                        .frame(width: 300, height: 400)
                        .padding()
                        .border(colorJasny, width: 5)
                        .cornerRadius(10.0)
                        
                    }
                    .scrollTransition { effect, phase in
                        effect
                            .scaleEffect (phase.isIdentity ? 1 : 0.7)
                        
                    }
                }
            }
        }
        Spacer()
        .padding()
        .onAppear {
            self.loadProducts()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK")) {
                    errorMessage = nil
                }
            )
        }
    }
    
    private func loadProducts() {
        isLoading = true
        Task {
            do {
                let fetchedProducts = try await fetchProducts(from: "https://leeves.pl/category/shop/koszule")
                DispatchQueue.main.async {
                    self.products = fetchedProducts
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error loading products: \(error)")
                    self.errorMessage = error.localizedDescription
                    self.showAlert = true
                    self.isLoading = false
                }
            }
        }
    }
}


struct koszule_Previews: PreviewProvider {
    static var previews: some View {
        shop(product: Product(url: "https://leeves.pl/shop/cardigan-chainstitch-light-green", imageUrl: "https://leeves.pl/wp-content/uploads/Cardigan-Chainstitch-light-green-2-300x300.png", title: "CARDIGAN CHAINSTITCH LIGHT GREEN", regularPrice: "449", salePrice: "249")) // Tutaj musisz dostarczyć przykładowy produkt

    }
}
