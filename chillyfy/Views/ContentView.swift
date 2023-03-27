//  File Name: ContentView.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI

struct ContentView: View {
    
    @AppStorage("uid") var userID:String = ""
    //print(userID)
    
    var body: some View {
//
//        if userID == "" {
//            AuthView()
//        } else {
//
//            BottomTabView()
//        }
        AuthView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
