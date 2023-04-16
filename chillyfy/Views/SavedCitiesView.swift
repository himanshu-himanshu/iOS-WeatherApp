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
    @ObservedObject private var viewModel = popularCitiesViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Popular Cities")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                List(viewModel.cities) { city in // (2)
                    VStack(alignment: .leading) {
                        Text(city.name)
                            .font(.headline)
                        Text(city.country)
                            .font(.subheadline)
                    }
                }
                
            }
            .ignoresSafeArea(.all)
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
    
    struct SavedCitiesView_Previews: PreviewProvider {
        static var previews: some View {
            SavedCitiesView()
        }
    }
}
