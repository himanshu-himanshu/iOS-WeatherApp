//
//  ContentView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        //Login()
        WeatherView()
        
//        VStack {
//            if let location = locationManager.location {
//                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
//            } else {
//                if locationManager.isLoading {
//                    LoadingView()
//                } else {
//                    WelcomeView()
//                        .environmentObject(locationManager)
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
