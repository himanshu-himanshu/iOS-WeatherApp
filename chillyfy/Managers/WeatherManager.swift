//
//  WeatherManager.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-31.
//

import Foundation
import CoreLocation

class WeatherManager {
    //var cityName = "brampton"
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getCurrentWeather(cityName: String) async throws -> ResponseBody {
        // Replace YOUR_API_KEY in the link below with your own
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + cityName + "&appid=c74d993ef7636c85096fe3f53d574195&units=metric") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    func getCurrentLocationWeather(lat: String, lon: String) async throws -> ResponseBody {
        // Replace YOUR_API_KEY in the link below with your own
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=c74d993ef7636c85096fe3f53d574195&units=metric") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

