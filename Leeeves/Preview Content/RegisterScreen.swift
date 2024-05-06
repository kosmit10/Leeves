import SwiftUI
import Firebase
struct RegisterScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    let colorJasny = Color(red: 238/255, green: 228/255, blue: 192/255)

    var body: some View {
        ZStack {
            Color(red: 238/255, green: 228/255, blue: 192/255)
            RoundedRectangle(cornerRadius: 0, style: .continuous)
            .foregroundStyle(.linearGradient(colors: [Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
            
            VStack {
                VStack {
                    HStack {
                        Image("logomal")
                            .resizable()
                            .frame(width: 230, height: 80)
                    }
                    .padding([.top, .leading, .trailing], 0.0)

                    HStack {
                        Text("Create\n        Account: ")
                            .bold()
                            .foregroundColor(colorJasny)
                            .font(.system(size: 50))
                            .padding(.trailing, -70.0)
                    }
                    .padding(.trailing, 100.0)
                }

                VStack(spacing: 20) {
                    TextField("Username: ", text: $username)
                        .foregroundColor(Color(red: 16/255, green: 71/255, blue: 52/255))
                        .autocapitalization(.sentences)
                        .disableAutocorrection(true)
                        .padding(.horizontal, 20.0)
                        .frame(width: 250, height: 70)
                        .background(Color(red: 238/255, green: 228/255, blue: 192/255))
                        .cornerRadius(30.0)
                        .border(Color(red: 50/255, green: 70/255, blue: 10/255))
                        .padding(.vertical, -11.0)

                    SecureField("Password: ", text: $password)
                        .foregroundColor(Color(red: 16/255, green: 71/255, blue: 52/255))
                        .padding(.horizontal, 20.0)
                        .frame(width: 250, height: 70)
                        .background(Color(red: 238/255, green: 228/255, blue: 192/255))
                        .border(Color(red: 50/255, green: 70/255, blue: 10/255))
                        .cornerRadius(30.0)

                        .padding()
                }
                .padding(.horizontal, 40.0)

                VStack {
                    Button("Join Now!") {
                        register()
                    }
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: 200, height: 60)
                    .background(colorJasny)
                    .cornerRadius(30.0)
                    .foregroundColor(Color(red: 16/255, green: 71/255, blue: 52/255))
                    .border(Color(red: 50/255, green: 70/255, blue: 10/255))
                    .cornerRadius(30.0)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Account Created"), message: Text(alertMessage), dismissButton: .default(Text("Oki")))
                    }
                }
            }
        }
        .ignoresSafeArea()
    }

    func register() {
        Auth.auth().createUser(withEmail: username, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                showAlert(message: "Failed to create an account. \(error.localizedDescription)")
            } else {
                showAlert(message: "Account created successfully!")
            }
        }
    }

    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}


