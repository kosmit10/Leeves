import SwiftUI

struct Basket: View {
    @Environment(\.presentationMode) var presentationMode
    let color = Color(red: 16/255, green: 71/255, blue: 52/255)
    let colorJasny = Color(red: 238/255, green: 228/255, blue: 192/255)
    @State var presentSheet = false
    @State private var menuExpanded = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(color)
                    Image("kartkafotka3")
                        .resizable()
                        .scaledToFit()
                        .offset(y: -geometry.size.height * 0.25)
                        .padding(.all, -20.0)
                    VStack {
                            Text("You're Cart:")
                                .foregroundColor(colorJasny)
                                .font(.system(size: 35))
                                .font(.caption)
                                .offset(x: UIScreen.main.bounds.height * -0.1)
                        Rectangle()
                            .foregroundColor(colorJasny)
                            .frame(width: geometry.size.width * 0.7, height: 3)
                            .padding(.leading, -60.0)
                        HStack{
//                            ZDJECIE DODAJ
                        }
                        VStack{
//                            CENY DODAJ I RESZTE
                        }

                    }
                    .padding()
                    .offset(y: UIScreen.main.bounds.height * -0.50)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.6, alignment: .bottom)
                    .background(color)
                    .cornerRadius(50.0)
                    .shadow(color: .black, radius: 30)
                    .offset(y: menuExpanded ? 0 : geometry.size.height * 0.25)
                    .animation(.easeInOut)
                }
                .gesture(
                    DragGesture()
                        .onEnded { gesture in
                            if gesture.translation.height < -50 {
                                menuExpanded = true
                            } else if gesture.translation.height > 50 {
                                menuExpanded = false
                            }
                        }
                )
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            })
            .ignoresSafeArea()
        }
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        Basket()
    }
}

