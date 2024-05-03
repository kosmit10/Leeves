import SwiftUI
import Firebase
struct ContentView: View {
    var screenWidth = UIScreen.main.bounds.width
    @State var xOffset: CGFloat = 0
    @State var currentXOffset: CGFloat = 0
    @Environment(\.colorScheme) var scheme
    @State var isMenuVisible = false
    var body: some View {
        ZStack {
            Slide_menu(isVisible: $isMenuVisible)
                .frame(width: screenWidth * 1)
                .offset(x: isMenuVisible ? 0 : -screenWidth * 0.5)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -50, y: 100)
            
            VStack {
                NavigationView {
                    ZStack {
                        Color(red: 238/255, green: 228/255, blue: 192/255)
                        RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
                        VStack {
                            AppBar()
                            Spacer()
                            Line1()
                            Spacer()
                            Line2()
                            Spacer()
                            Icon()
                            Spacer()
                            }
                        }
                        .ignoresSafeArea()
                        .padding(.top, -50.0)
                        Spacer()
                    }
                    .navigationBarBackButtonHidden(true)
                
            }
            .offset(x: isMenuVisible ? screenWidth * 0.9 : 0) // Przesunięcie zawartości w zależności od widoczności menu
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    let newOffset = currentXOffset + value.translation.width
                    if newOffset >= 0 && newOffset <= screenWidth * 0.8 {
                        xOffset = newOffset
                    }
                })
                .onEnded({ value in
                    let triggerWidth = screenWidth * 0.4
                    if value.predictedEndTranslation.width < -triggerWidth {
                        withAnimation {
                            isMenuVisible = false
                        }
                    } else if value.predictedEndTranslation.width > triggerWidth {
                        withAnimation {
                            isMenuVisible = true
                        }
                    }
                    currentXOffset = isMenuVisible ? screenWidth * 0.8 : 0
                    xOffset = currentXOffset
                })
        )
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: -40, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBar: View {
    @State private var isMenuVisible = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    isMenuVisible.toggle()
                }
            }) {
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 40)
                    .padding(.leading, 30.0)
            }
            Spacer()
            
            Image("logomal")
                .resizable()
                .frame(width: 130, height: 40)
                .padding(.trailing, 10.0)
            
            Spacer()
            
            Button(action: {}) {
                Image("kompas")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .padding(.trailing, 25.0)
            }
        }
        .padding(.top, 60.0)
    }
}


struct Line1: View {
    @State private var isstoriesPresented = false
    @State private var isshopPresented = false
    @State private var products: [Product] = []
    var body: some View {
        HStack {
            VStack {
                NavigationLink(
                    destination: shop(product: Product(url: "https://leeves.pl/shop/cardigan-chainstitch-light-green", imageUrl: "https://leeves.pl/wp-content/uploads/Cardigan-Chainstitch-light-green-2-300x300.png", title: "CARDIGAN CHAINSTITCH LIGHT GREEN", regularPrice: "449", salePrice: "249")),
                    isActive: $isshopPresented
                ){
                    Button(action: {
                        isshopPresented = true
                    }) {
                        ZStack {
                            Image("kartka1")
                                .resizable()
                                .frame(width: 150, height: 260)
                                .padding([.bottom, .trailing], -30.0)
                            
                            VStack {
                                Text("SHOP")
                                    .bold()
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                
                                Image("kartkafotashop")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .padding(.top, -10.0)
                            }
                            .padding(.trailing, -20.0)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            Spacer()
            VStack {
                NavigationLink(
                    destination: stories(),
                    isActive: $isstoriesPresented
                ){
                    Button(action: {
                        isstoriesPresented = true
                    }) {
                        ZStack {
                            Image("kartka2")
                                .resizable()
                                .frame(width: 150, height: 260)
                                .padding([.leading, .bottom], -30.0)
                            
                            VStack {
                                Text("STORIES")
                                    .bold()
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding()
                                
                                Image("kartkafota")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .padding(.top, -20.0)
                            }
                            .padding([.top, .leading, .bottom], -30.0)
                        }
                    }
                }
                .padding(.horizontal)
            }
            }
            
        }
    }
    
    struct Line2: View {
        @State private var isarchivepresented = false
        var body: some View {
            HStack {
                VStack {
                    Button(action: {}) {
                        ZStack {
                            Image("kartka3")
                                .resizable()
                                .frame(width: 150, height: 260)
                                .padding([.bottom, .trailing], -30.0)
                            
                            VStack {
                                Text("ABOUT US")
                                    .padding(.top)
                                    .bold()
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding([.leading, .bottom], 20.0)
                                
                                Image("kartkafotka3")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .padding([.top, .trailing], -25.0)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                VStack {
                    NavigationLink(
                        destination: archive(),
                        isActive: $isarchivepresented
                    ){
                        Button(action: {
                            isarchivepresented = true
                        }) {
                            ZStack {
                                Image("kartka1")
                                    .resizable()
                                    .frame(width: 150, height: 260)
                                    .padding(.bottom, -70.0)
                                VStack {
                                    Text("ARCHIVE")
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .padding()
                                    
                                    Image("kartkafotka4")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                }
                                .padding(.bottom, -10.0)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    struct Icon: View {
        var body: some View {
            HStack {
                Button(action: {
                    guard URL(string: "https://leeves.pl") != nil else {return}
                }) {
                    Image("iconfb")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.vertical)
                }
                
                Button(action: {
                    guard let url = URL(string: "https://www.instagram.com/itleeves/") else {return}
                    UIApplication.shared.open(url)
                }){
                    Image("iconig")
                        .resizable()
                        .frame(width: 65, height: 55)
                        .padding(.vertical)
                }
            }
            .padding(.vertical, 5.0)
        }
    }
    
    struct Footer: View {
        var body: some View {
            HStack {
                Text("App Designer by maciura")
                    .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
            }
            .padding()
        }
    }

