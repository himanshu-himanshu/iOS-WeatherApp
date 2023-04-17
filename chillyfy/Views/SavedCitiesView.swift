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
  @ObservedObject private var values = userValues()
  @State var isLinkActive = false

  var body: some View {
    NavigationView {

      ZStack {
        LinearGradient(
          gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]),
          startPoint: .leading, endPoint: .trailing)

        VStack {
          Spacer()
            .frame(height: 60)

          HStackLayout {
            Text("Popular Cities")
              .font(.custom("Fasthand-Regular", size: 44))
              .foregroundColor(Color.white)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 30)

          Spacer()
            .frame(height: 40)

          VStack {
            List(viewModel.cities) { city in
              NavigationLink(
                destination: WeatherInitialView(cityName: city.name),
                label: {
                  HStack(spacing: 40) {
                    AsyncImage(url: URL(string: city.imageUrl)!) { image in
                      image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    } placeholder: {
                      Image(systemName: "City Image")
                    }.frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                      Text(city.name)
                        .font(.custom("Raleway", size: 24))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color.black.opacity(0.9))
                      Text(city.country)
                        .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.7))
                    }
                  }
                  .padding(5)
                })
            }
          }
          .onAppear {
            self.viewModel.fetchData()
          }
        }

      }
      .ignoresSafeArea(.all)

    }
    .navigationTitle("")
  }

  struct SavedCitiesView_Previews: PreviewProvider {
    static var previews: some View {
      SavedCitiesView()
    }
  }
}
