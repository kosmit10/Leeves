import SwiftUI

struct shop: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedIndex: Int = 0
    let color_jasny = Color(red: 238/255, green: 228/255, blue: 192/255)
    private let categories = ["Wszystkie", "Akcesoria", "Bluzy", "Koszule", "Koszulki", "Kurtki", "Spodnie", "Swetry"]
    var product: Product
    
    @State private var products: [Product] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 238/255, green: 228/255, blue: 192/255)
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
                VStack{
                    AppBar()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                Categories(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                    }
                    .padding()
                        ScrollView {
                            if selectedIndex == 0 {
                                wszystko(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                                
                            }
                            else {
                                EmptyView()
                            }
                            if selectedIndex == 1 {
                                akcesoria(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 2 {
                                bluzy(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 3 {
                                koszule(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 4 {
                                koszulki(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 5 {
                                kurtki(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 6 {
                                spodnie(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                            if selectedIndex == 7 {
                                swetry(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, showAlert: $showAlert)
                            } else {
                                EmptyView()
                        }
                    }
                }
                .padding(.top, 0.0)
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
        .navigationBarBackButtonHidden(true)
    }
    
    struct Categories: View {
        let isActive: Bool
        let text: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(isActive ? Color(red: 238/255, green: 228/255, blue: 192/255) : Color.black.opacity(0.5))
                
                if isActive {
                    Color("")
                        .frame(width: 10, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
    }
}
struct shop_Previews: PreviewProvider {
    static var previews: some View {
        shop(product: Product(url: "https://leeves.pl/shop/cardigan-chainstitch-light-green", imageUrl: "https://leeves.pl/wp-content/uploads/Cardigan-Chainstitch-light-green-2-300x300.png", title: "CARDIGAN CHAINSTITCH LIGHT GREEN", regularPrice: "449", salePrice: "249"))

    }
}

