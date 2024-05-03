//
//  archive.swift
//  Leeeves
//
//  Created by maciura on 05/04/2024.
//

import SwiftUI

struct archive: View {
    @State var isMenuVisible = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 238/255, green: 228/255, blue: 192/255)
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [     Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
                
                ScrollView {
                    VStack{
                        AppBar()
                        Photo()
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.top, -50.0)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 100 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
}

#Preview {
    archive()
}

struct Photo: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack{
                        Text("23/04/2022\nNational Park II")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing)
                        
                        Image("strzalka5")
                            .resizable()
                            .frame(width: 70, height: 50)
                            .rotationEffect(.degrees(-20))
                        //                                    .scaleEffect(x: 1, y: -1)
                        
                    }
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    
                    Image("a3")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .border(Color.white, width: 4)
                        .padding(.leading)
                        .rotationEffect(.degrees(15))
                        .padding()
                    
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 50.0)
            
            VStack {
                HStack {
                    
                    Image("a2")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .border(Color.white, width: 4)
                        .padding(.leading, -20.0)
                        .rotationEffect(.degrees(-10))
                        .padding()
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    Spacer()
                    VStack{
                        Text("10/07/2022\nLeeves x Oki")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 10.0)
                        
                        Image("strzalka3")
                            .resizable()
                            .frame(width: 70, height: 60)
                            .rotationEffect(.degrees(180))
                        //                                    .scaleEffect(x: 1, y: -1)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            VStack {
                HStack {
                    VStack{
                        Text("25/08/2022\nLeeves 2005")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing)
                        
                        Image("strzalka7")
                            .resizable()
                            .frame(width: 90, height: 50)
                        //                                    .scaleEffect(x: 1, y: -1)
                        
                    }
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    
                    Image("a1")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .border(Color.white, width: 4)
                        .padding(.leading)
                        .rotationEffect(.degrees(15))
                        .padding()
                    
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
            
            
            
            VStack {
                HStack {
                    
                    Image("a4")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .border(Color.black, width: 4)
                        .padding(.leading, -20.0)
                        .rotationEffect(.degrees(-10))
                        .padding()
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    Spacer()
                    VStack{
                        Text("20/04/2020\nHemp drop")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 10.0)
                        
                        Image("strzalka1")
                            .resizable()
                            .frame(width: 80, height: 70)
                            .rotationEffect(.degrees(100))
                        //                                    .scaleEffect(x: 1, y: -1)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            
            VStack {
                HStack {
                    VStack{
                        Text("16/03/22\nFaster Than Ever Collection II")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing)
                        
                        
                        Image("strzalka4")
                            .resizable()
                            .frame(width: 70, height: 60)
                            .rotationEffect(.degrees(-40))
                            .scaleEffect(x: 1, y: -1)
                    }
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    
                    Image("a5")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .border(Color.white, width: 4)
                        .padding(.leading)
                        .rotationEffect(.degrees(15))
                        .padding()
                    
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            
            VStack {
                HStack {
                    
                    Image("a6")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .border(Color.white, width: 4)
                        .padding(.leading, -20.0)
                        .rotationEffect(.degrees(-10))
                        .padding()
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 2, height: 200)
                        .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                    Spacer()
                    VStack{
                        Text("9/02/2022\nValentines Collection")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 238/255, green: 228/255, blue: 192/255))
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 10.0)
                        
                        Image("strzalka5")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .rotationEffect(.degrees(-130))
                        //                                    .scaleEffect(x: 1, y: -1)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}
