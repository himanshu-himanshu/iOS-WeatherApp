//
//  SavedCitiesView.swift
//  File Name: SavedCities.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI

struct SavedCitiesView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Saved Cities")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct SavedCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCitiesView()
    }
}
