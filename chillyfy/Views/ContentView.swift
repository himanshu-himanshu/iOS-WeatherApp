//
//  ContentView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var isLoggesIn = false
    
    var body: some View {
        if isLoggesIn {
            BottomTabView()
        } else {
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
