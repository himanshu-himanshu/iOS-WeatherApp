//  File Name: SavedCities.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SavedCitiesView: View {
  @ObservedObject private var viewModel = popularCitiesViewModel()
  @ObservedObject private var values = userValues()
  @State var isLinkActive = false
    @State var isCelsius = true
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
    NavigationView {

      ZStack {
        LinearGradient(
          gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]),
          startPoint: .leading, endPoint: .trailing)

        VStack {
          Spacer()
            .frame(height: 60)

          HStackLayout {
            Text("Popular Cities")
              .font(.custom("Fasthand-Regular", size: 44))
              .foregroundColor(Color.white)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 30)

          Spacer()
            .frame(height: 40)

          VStack {
            List(viewModel.cities) { city in
              NavigationLink(
                destination: WeatherInitialView(cityName: city.name, lat: city.lat, lon: city.lon, units: units),
                label: {
                  HStack(spacing: 40) {
                    AsyncImage(url: URL(string: city.imageUrl)!) { image in
                      image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    } placeholder: {
                      Image(systemName: "City Image")
                    }.frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                      Text(city.name)
                        .font(.custom("Raleway", size: 24))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color.black.opacity(0.9))
                      Text(city.country)
                        .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.7))
                    }
                  }
                  .padding(5)
                })
            }
          }
          .onAppear {
            self.viewModel.fetchData()
              fetchDataFromFirestore()
          }
        }

      }
      .ignoresSafeArea(.all)

    }
    .navigationTitle("")
  }

  struct SavedCitiesView_Previews: PreviewProvider {
    static var previews: some View {
      SavedCitiesView()
    }
  }
}
