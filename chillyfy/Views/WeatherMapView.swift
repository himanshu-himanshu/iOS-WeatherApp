//  File Name: WeatherMap.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 2

//  Task: Creating Weather App

//  Date modified: 16/04/2023

import SwiftUI
import MapKit

struct WeatherMapView: View {
    
    @State private var viewModal = WeatherMapViewModal()
    
    var body: some View {
        
        Map(coordinateRegion: $viewModal.region)
            .accentColor(Color.pink)
            .onAppear {
                viewModal.checkIfLocationServicesIsEnabled()
            }
            .ignoresSafeArea(.all)
    }
}

struct WeatherMapView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMapView()
    }
}

final class WeatherMapViewModal: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.731795087500494, longitude: -79.76161174046985), span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager = CLLocationManager()
                self.locationManager!.delegate = self
            } else {
                print("Turn on")
            }
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Turn on")
        case .denied:
            print("Turn on")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
