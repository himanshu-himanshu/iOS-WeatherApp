//  File Name: WeatherView.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI
import MapKit
import CoreLocation

struct WeatherView: View {

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient2"), Color("Gradient1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(alignment: .leading) {
                Button(action: {
                    print("Saved city to database")
                }) {
                    Image("like")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .top)
                }
            }
            .position(x:350, y:90)
            
            VStack {
                Image("cloudy2")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 150, alignment: .bottom)
                
                Text("Cloudy")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                Text("2°")
                    .font(.custom("Raleway", size: 88))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
                HStack {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .bottom)
                    
                    Text("Brampton, CA")
                        .font(.custom("Raleway", size: 22))
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                    .frame(height: 70)
                
                VStack {
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(spacing: 40) {
                        Image("sun")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .bottom)
                        
                        
                        Text("26/03/2023")
                            .font(.custom("Raleway", size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                        
                        Text("7°")
                            .font(.custom("Raleway", size: 32))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .frame(height: 40)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(spacing: 40) {
                        Image("storm")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .bottom)
                        
                        
                        Text("27/03/2023")
                            .font(.custom("Raleway", size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                        
                        Text("4°")
                            .font(.custom("Raleway", size: 32))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .frame(height: 40)
                    
                    Spacer()
                        .frame(height: 20)
                }
                .background(Color("Gradient1"))
                .cornerRadius(10)
                
                Spacer()
                    .frame(height: 80)
                
            }

        }.ignoresSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
