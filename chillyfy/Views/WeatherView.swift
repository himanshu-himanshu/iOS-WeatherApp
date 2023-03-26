//  WeatherView.swift
//  chillyfy
//  Created by Himanshu on 2023-03-24.

import SwiftUI
import MapKit
import CoreLocation

struct WeatherView: View {

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient2"), Color("Gradient1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Image("sun")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 150, alignment: .bottom)
                
                Text("Sunny")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                Text("44°")
                    .font(.custom("Raleway", size: 88))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
                HStack {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .bottom)
                    
                    Text("Brampton, Canada")
                        .font(.custom("Raleway", size: 22))
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                }
                
            }

        }.ignoresSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
