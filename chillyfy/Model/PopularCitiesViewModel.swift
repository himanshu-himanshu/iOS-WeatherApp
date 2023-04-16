//
//  PopularCitiesViewModel.swift
//  chillyfy
//
//  Created by Himanshu on 2023-04-16.
//

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
                return City(name: name, lat: lat, lon: lon, country: country)
            }
        }
    }
}
