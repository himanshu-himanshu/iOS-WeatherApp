//  WeatherInitialView.swift
//  chillyfy
//  Created by Himanshu on 2023-03-31.

import SwiftUI

struct WeatherInitialView: View {
    var cityName:String
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @ObservedObject private var values = userValues()
    
    var body: some View {
        VStack {
            if values.weather != nil {
                WeatherView(weather: values.weather!)
            } else {
                LoadingView()
                    .task {
                        do {
                            values.weather = try await values.getCurrentWeather(cityName: cityName)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        }.onAppear() {

        }
    }
}

struct WeatherInitialView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInitialView(cityName: "Brampton")
    }
}
