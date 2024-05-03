import SwiftUI

struct Slide_menu: View {
    let color = (Color(red: 238/255, green: 228/255, blue: 192/255))
    let zielony = Color(red: 50/255, green: 70/255, blue: 10/255)
    var screenWidth = UIScreen.main.bounds.width
    @State var xOffset: CGFloat = 0
    @State var currentXOffset: CGFloat = 0
    @Binding var isVisible: Bool // Dodany argument typu Binding

    var body: some View {
        NavigationView{
            ZStack{
                color
                VStack{ //CALOSC
                    VStack{
                        HStack{
                            Image("logo")
                                .resizable()
                                .frame(width: 80, height: 70)
                                .foregroundColor(zielony)
                        }
                        .padding(.top, 80.0)
                    }
                    .padding(.bottom, 10.0)
                    VStack{
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(zielony)
                        HStack{
                            Text("Options")
                                .font(.system(size: 25))
                                .foregroundColor(zielony)
                            Image(systemName: "gear")
                                .foregroundColor(zielony)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(zielony)
                    }
                    VStack{
                        HStack{
                            Text("Delivery")
                                .font(.system(size: 25))
                                .foregroundColor(zielony)
                            Image(systemName: "shippingbox.fill")
                                .foregroundColor(zielony)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(zielony)
                    }
                    VStack{
                        HStack{
                            Text("About Me")
                                .font(.system(size: 25))
                                .foregroundColor(zielony)
                            Image(systemName: "person.fill")
                                .foregroundColor(zielony)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(zielony)
                    }
                    VStack{
                        HStack{
                            Text("Favorite")
                                .foregroundColor(zielony)
                                .font(.system(size: 25))
                            Image(systemName: "star.fill")
                                .foregroundColor(zielony)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(zielony)
                    }
                    VStack{
                        Image("prof")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(15.0)
                        Text("@maciura")
                    }
                    Spacer()
                }
                .padding(.trailing, 10.0)
            }
            .ignoresSafeArea()
        }
    }
}

struct Slide_menu_Previews: PreviewProvider {
    static var previews: some View {
        Slide_menu(isVisible: .constant(false)) // Przykładowy podgląd
    }
}
