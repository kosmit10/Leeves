//
//  ContentView.swift
//  Leeves
//
//  Created by maciura on 14/01/2024.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUsername = false
    @State private var wrongPassword = false
    @State private var showingLoginscreen = false
    @State private var isregisterscreenPresented = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 238/255, green: 228/255, blue: 192/255)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [     Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
                                    .frame().frame(width: 1000, height: 500)
                                    .rotationEffect(.degrees(135))
                                    .offset(y:20)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 110, height: 100)
                            .padding(.trailing, -20.0)
                        
                        Text("eeves")
                            .padding(.top, 40.0)
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .padding(.vertical, 10.0)
                    }
                    .padding()
                    
                    VStack(spacing: 20) {
                        TextField("Username", text: $username)
                            .autocapitalization(.sentences)
                            .disableAutocorrection(true)
                            .padding(.horizontal, 20.0)
                            .frame(width: 250, height: 60)
                            .background(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .cornerRadius(10.0)
                            .border(wrongUsername ? Color.red : Color.clear)
                            .padding(.vertical, -11.0)
                        
                        SecureField("Password", text: $password)
                            .padding(.horizontal, 20.0)
                            .frame(width: 250, height: 60)
                            .background(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .cornerRadius(10.0)
                            .border(wrongPassword ? Color.red : Color.clear)
                            .padding()
                    }
                    VStack{
                        Button(action: {
                            login()
                        }) {
                            HStack {
                                Text("Login")
                                    .bold()
                                    .font(.system(size: 25))
                                    .foregroundColor(Color(red: 50/255, green: 70/255, blue: 10/255))
                                    .padding(.horizontal)
                                
                                Image(systemName: "lock.open.fill")
                                    .foregroundColor(Color(red: 50/255, green: 70/255, blue: 10/255))
                                    .font(.system(size: 25))
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 30.0)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255)))
                        .frame(width: 180, height: 60)
                        .border(Color(red: 238/255, green: 228/255, blue: 192/255), width: 10)
                        .cornerRadius(30.0)
                        
                        
                        Button(action: {
                            isregisterscreenPresented.toggle()
                        }){
                            Text("If you don't have accout\nPlease click here to create")
                        }
                        .sheet(isPresented: $isregisterscreenPresented) {
                            RegisterScreen()
                        }
                        .bold()
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                        }
                    
                    
                    Spacer()
                }
                .background(NavigationLink("", destination: ContentView(), isActive: $showingLoginscreen).hidden())
            }
            .ignoresSafeArea()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if error == nil {
                showingLoginscreen = true
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}


