//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct WeatherInitialView: View {
    var cityName:String
    var lat:String
    var lon:String
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @State var isCelsius = true
    @ObservedObject private var values = userValues()
    let loggedUserId = AuthView.loggedUserID
    @State var units = "metric"
    
    let db = Firestore.firestore()

    /** Fetch data from Firestore database using logged in user ID */
    func fetchDataFromFirestore() {
        
        let docRef = db.collection("users").document(loggedUserId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                isCelsius = (((document.data()!["tempCelsius"])) as! Bool)
                units = isCelsius ? "metric" : "imperial"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some View {
        VStack {
            if values.weather != nil {
                WeatherView(weather: values.weather!)
            } else {
                LoadingView()
                    .task {
                        do {
                            values.weather = try await values.getCurrentLocationWeather(lat: lat, lon: lon, units: units)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        }.onAppear() {
            fetchDataFromFirestore()
        }
    }
}

struct WeatherInitialView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInitialView(cityName: "Brampton", lat: "12.12", lon: "12.12", units: "")
    }
}
