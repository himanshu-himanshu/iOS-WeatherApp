//
//  LocationManager.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-24.
//

import Foundation

import CoreLocation

class LocationManager: NSObject, ObservableObject {
   
    private let locationManager = CLLocationManager()
    
    
    @Published var locations: [CLLocation] = []
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .fitness
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func requestLocation(){
        isLoading = true
        locationManager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locations = locations
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager did fail with error: \(error.localizedDescription)")
        isLoading = false
    }
}
