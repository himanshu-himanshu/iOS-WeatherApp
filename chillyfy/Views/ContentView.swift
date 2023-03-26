//
//  ContentView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-23.

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
       AuthView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
