//
//  WeatherInitialView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-31.

import SwiftUI

struct WeatherInitialView: View {
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let weather = weather {
                WeatherView(weather: weather)
            } else {
                LoadingView()
                    .task {
                        do {
                            weather = try await weatherManager.getCurrentWeather()
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        }
    }
}

struct WeatherInitialView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInitialView()
    }
}
