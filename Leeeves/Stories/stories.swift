//
//  stories.swift
//  Leeves
//
//  Created by maciura on 18/01/2024.
//

import SwiftUI

struct stories: View {
    @State var isMenuVisible = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 238/255, green: 228/255, blue: 192/255)
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [     Color(red: 16/255, green: 71/255, blue: 52/255), Color(red: 50/255, green: 70/255, blue: 10/255)], startPoint: .topLeading, endPoint: .bottomLeading))
                ScrollView{
                    VStack { //ogolny
                        AppBar()
                            .padding(.horizontal)
                        Stories()
                        Photos()
                        Image("logomal")
                            .resizable()
                            .frame(width: 170, height: 60)
                            .padding()
            
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

struct stories_Previews: PreviewProvider {
    static var previews: some View {
        stories()
    }
}

struct Stories: View {
    var body: some View {
        ZStack {
            Image("ozdoba")
                .resizable()
                .frame(width: 350, height: 130)
                .padding(.horizontal)
            
            Text("STORIES")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing, 90.0)
                .padding(.bottom, 25.0)
                .bold()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.109, saturation: 0.045, brightness: 0.22)/*@END_MENU_TOKEN@*/)
        }
        .padding(.all)
    }
}

struct Photos: View {
    var body: some View {
        VStack {
            HStack{
                Image("stories1")
                    .resizable()
                    .frame(width: 400, height: 350)
            }
            .padding(.horizontal)
            .padding(.top, -30.0)
            
            HStack{
                Image("stories2")
                    .resizable()
                    .frame(width: 400, height: 350)
            }
            .padding(.horizontal)
            HStack{
                Image("stories3")
                    .resizable()
                    .frame(width: 400, height: 350)
            }
            .padding()

            HStack{
                Image("stories4")
                    .resizable()
                    .frame(width: 400, height: 200)
            }
            .padding(.horizontal)
            
            HStack{
                Image("stories5")
                    .resizable()
                    .frame(width: 400, height: 250)
            }
            .padding(.horizontal)
            HStack{
                Image("stories6")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            .padding(.horizontal)
            HStack{
                Image("stories7")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            .padding(.horizontal)
            HStack{
                Image("stories8")
                    .resizable()
                    .frame(width: 400, height: 300)
            }
            .padding(.horizontal)
            HStack{
                Image("stories9")
                    .resizable()
                    .frame(width: 400, height: 650)
            }
            .padding(.horizontal)
            HStack{
                Image("stories10")
                    .resizable()
                    .frame(width: 400, height: 320)
            }
            .padding(.horizontal)
//            HStack{
//                Image("stories11")
//                    .resizable()
//                    .frame(width: 400, height: 350)
//            }
//            .padding(.horizontal)
//            HStack{
//                Image("stories12")
//                    .resizable()
//                    .frame(width: 400, height: 350)
//            }
//            .padding(.horizontal)
//            HStack{
//                Image("stories13")
//                    .resizable()
//                    .frame(width: 400, height: 350)
//            }
//            .padding()
        }
    }
}

