//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI

struct WeatherDetails: View {
    var firstHeading: String
    var secondHeading: String
    var firstValue: String
    var secondValue: String

    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Rectangle()
                    .frame(width: 140,height: 100)
                    .foregroundColor(.gray)
                    .blendMode(.hardLight)
                    .cornerRadius(10)
                
                VStack(spacing: 10) {
                    Text(firstHeading)
                        .font(.custom("Raleway", size: 18))
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                    
                    Text(firstValue == "-0" ? "0" : firstValue)
                        .font(.custom("Raleway", size: 32))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                .foregroundStyle(.ultraThickMaterial)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 140,height: 100)
                    .foregroundColor(.gray)
                    .blendMode(.hardLight)
                    .cornerRadius(10)
                
                VStack(spacing: 10) {
                    Text(secondHeading)
                        .font(.custom("Raleway", size: 18))
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                    
                    Text(secondValue == "-0" ? "0" : secondValue)
                        .font(.custom("Raleway", size: 32))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                .foregroundStyle(.ultraThickMaterial)
            }
        }
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetails(firstHeading: "", secondHeading: "", firstValue: "", secondValue: "")
    }
}
