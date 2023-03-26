//
//  WeatherMapView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-26.
//

import SwiftUI

struct WeatherMapView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient5"), Color("Gradient6")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Map View")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct WeatherMapView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMapView()
    }
}
