//
//  chillyfyApp.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-23.
//

import SwiftUI
import FirebaseCore

@main
struct chillyfyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
            //ContentView()
        }
    }
}
