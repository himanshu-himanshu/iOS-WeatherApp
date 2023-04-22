//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI

struct AboutView: View {
    var aboutHeading:String = "Chillyfy is a weather app developed using Swift as a primary programming language also SwiftUI is used to design the app."
    var aboutSub:String = "The app is using CoreLocation framework to detect the current location of the user and MapKit is used to show the current location on Map."
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient8"), Color("Gradient7")]), startPoint: .leading, endPoint: .trailing)
            VStack {
                Spacer()
                    .frame(height: 10)
                
                HStackLayout() {
                    Text("Chillyfy")
                        .font(.custom("Fasthand-Regular", size: 44))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 30)
                
                Image("cloudy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120, alignment: .bottom)
                    .clipped()
                    .shadow(radius: 3)
                
                HStackLayout() {
                    Text(aboutHeading)
                        .font(.custom("Raleway", size: 18))
                        .fontWeight(Font.Weight.medium)
                        .foregroundColor(Color("Primary"))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 30)
                .padding(.top, 60)
                
                HStackLayout() {
                    Text(aboutSub)
                        .font(.custom("Raleway", size: 18))
                        .foregroundColor(Color("Primary"))
                        .fontWeight(Font.Weight.medium)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                Spacer()
                    .frame(height: 120)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
