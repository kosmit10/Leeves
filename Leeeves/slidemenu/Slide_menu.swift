import SwiftUI

struct Slide_menu: View {
    let color = (Color(red: 16/255, green: 71/255, blue: 52/255))
    let zielony = Color(red: 50/255, green: 70/255, blue: 10/255)
    let tekst = Color(red: 238/255, green: 228/255, blue: 192/255)
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
                                .foregroundColor(tekst)
                        }
                        .padding(.top, 80.0)
                    }
                    .padding(.bottom, 10.0)
                    VStack{
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(tekst)
                        HStack{
                            Text("Options")
                                .font(.system(size: 25))
                                .foregroundColor(tekst)
                            Image(systemName: "gear")
                                .foregroundColor(tekst)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(tekst)
                    }
                    VStack{
                        HStack{
                            Text("Delivery")
                                .font(.system(size: 25))
                                .foregroundColor(tekst)
                            Image(systemName: "shippingbox.fill")
                                .foregroundColor(tekst)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(tekst)
                    }
                    VStack{
                        HStack{
                            Text("About Me")
                                .font(.system(size: 25))
                                .foregroundColor(tekst)
                            Image(systemName: "person.fill")
                                .foregroundColor(tekst)
                                .font(.system(size: 25))
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(tekst)
                    }
                    VStack{
                        Button(action: {}){
                            HStack{
                                Text("Shop basket")
                                    .foregroundColor(tekst)
                                    .font(.system(size: 25))
                                Image(systemName: "basket.fill")
                                    .foregroundColor(tekst)
                                    .font(.system(size: 25))
                            }
                        }
                        Rectangle()
                            .frame(width: 200, height: 2 )
                            .foregroundColor(tekst)
                    }
                    VStack{
                        Image("prof")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(15.0)
                        Text("@maciura")
                            .foregroundColor(tekst)
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
