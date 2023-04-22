//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import Foundation

struct City: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var lat: String
    var lon: String
    var country: String
    var imageUrl: String
}
