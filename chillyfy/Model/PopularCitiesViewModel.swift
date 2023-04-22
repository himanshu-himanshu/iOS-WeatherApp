//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import Foundation
import FirebaseFirestore

class popularCitiesViewModel: ObservableObject {
    
    @Published var cities = [City]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("popularCities").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.cities = documents.map { (queryDocumentSnapshot) -> City in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let country = data["country"] as? String ?? ""
                let lat = data["lat"] as? String ?? ""
                let lon = data["lon"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
                return City(name: name, lat: lat, lon: lon, country: country, imageUrl: imageUrl)
            }
        }
    }
}
