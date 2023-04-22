//  File Name: Splash.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Color("Primary")
                    .ignoresSafeArea()
                
                VStack {
                    Image("cloudy")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .bottom)
                    
                    Text("Chillyfy")
                        .font(.custom("Fasthand-Regular", size: 38))
                        .padding(.vertical)
                        .foregroundColor(Color.white)  
                }
                .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true;
                }
            }
        }
    }
}

struct SplashView_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
