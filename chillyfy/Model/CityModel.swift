//
//  CityModel.swift
//  chillyfy
//
//  Created by Himanshu on 2023-04-16.
//

import Foundation

struct City: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var lat: String
    var lon: String
    var country: String
    var imageUrl: String
}
