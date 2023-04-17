//  File Name: WeatherView.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI
import MapKit
import CoreLocation

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient2"), Color("Gradient1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                    .frame(height: 0)
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/" + weather.weather[0].icon  + "@4x.png")) {
                    image in
                    image
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160, alignment: .center)
                    Spacer()
                        .frame(height: 0)
                    
                } placeholder: {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160, alignment: .center)
                    Spacer()
                        .frame(height: 0)
                }
                Spacer()
                    .frame(height: 0)
                
                Text(weather.weather[0].main)
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                Text(weather.main.temp.roundDouble() + ("°"))
                    .font(.custom("Raleway", size: 88))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: 10)
                
                HStack {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .bottom)
                    
                    Text(weather.name + ", " + weather.sys.country)
                        .font(.custom("Raleway", size: 22))
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                    .frame(height: 50)
                
                VStack(spacing: 10) {
                    WeatherDetails(firstHeading: "Feels Like", secondHeading: "Humidity  ", firstValue: (weather.main.feelsLike.roundDouble() + ("°")), secondValue: (weather.main.humidity.roundDouble() + ("%")))
                    
                    WeatherDetails(firstHeading: "Min Temp", secondHeading: "Max Temp", firstValue: (weather.main.tempMin.roundDouble() + ("°")), secondValue: (weather.main.tempMax.roundDouble() + ("°")))
                }.padding(.horizontal, 20)
                
                Spacer()
                    .frame(height: 60)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
