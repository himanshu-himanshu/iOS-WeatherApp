//
//  WelcomeView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    Text("Chillyfy")
                        .font(.custom("Fasthand-Regular", size: 38))
                        .padding(.vertical)
                        .foregroundColor(.white)
                    
                    Text("Welcome, please share your location to get the weather information")
                        .padding()
                        .foregroundColor(.white.opacity(0.8))
                }
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(50)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
