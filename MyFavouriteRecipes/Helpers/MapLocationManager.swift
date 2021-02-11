//
//  MapLocationManager.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-11.
//

import UIKit
import Foundation
import Combine
import CoreLocation

class MapLocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    // @Published variables listen to when the particular variable has changed value and will announce (or publish) the change.
    @Published var status: CLAuthorizationStatus? {
        // this will tell any objects listening (objects prefixed with @ObservableObject) that there has been a change made
        willSet { objectWillChange.send() }
    }
    
    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}


// Extensions are a great place to keep delegate methods, as not only do they help separate out the logic in potentially large classes, but they can also be extracted to another file if needed.
// Here we have created an extension on our LocationManager and conformed this to the CLLocationManagerDelegate protocol.
extension MapLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
