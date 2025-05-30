//
//  LocationManager.swift
//  Ryde
//
//  Created by baxtiyor bekmurodov on 22/04/25.
//

//import SwiftUI
//import CoreLocation
//
//class LocationManager : NSObject, ObservableObject {
//
//    private let locationManager = CLLocationManager()
//    
//    @Published var userLocation: CLLocation?
//    
//    override init() {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//    
//  
//}
//
//
//extension LocationManager : CLLocationManagerDelegate {
////    func locationManager(_ manager: CLLocationManager, didVisit location: [CLLocation]) {
////        guard !location.isEmpty else {return}
////
////        locationManager.stopUpdatingLocation()
////    }
//    
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//           guard let location = locations.last else { return }
//           self.userLocation = location
//           locationManager.stopUpdatingLocation() // Optional: stop after first fetch
//       }
//       
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//           print("Location error: \(error.localizedDescription)")
//    }
//}


import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation : CLLocationCoordinate2D?
        
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

}


extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        self.userLocation = location.coordinate

        locationManager.stopUpdatingLocation()

    }
    
  
}
