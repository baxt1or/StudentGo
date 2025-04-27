import SwiftUI
import MapKit
import Foundation

class LocationSearchViewModel : NSObject, ObservableObject {
    
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedStudentGoLocation : StudentGoLocation?
    @Published var pickupTime : String?
    @Published var dropoffTime : String?
    
    
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment : String = "" {
        didSet {

            searchCompleter.queryFragment = queryFragment
        }
    }
    
    
    var userLocation : CLLocationCoordinate2D?
    
    
    
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
   }
    
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        
        locationSearch(forLocalSeachCompletion: localSearch) {response, error  in
            
            if let err = error{
                print("Error")
                
                return
            }
            
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            self.selectedStudentGoLocation = StudentGoLocation(title: localSearch.title, coordinate: coordinate)
            print("DEBUD: \(coordinate)")
        }

    }
    
    func locationSearch(forLocalSeachCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    
    func cumputeRidePrice(forType type: RideType) -> Double {
        guard let coordinate = selectedStudentGoLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation else { return 0.0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        
        return type.computePrice(for: tripDistanceInMeters)
    }
    
    
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination : CLLocationCoordinate2D, completion : @escaping(MKRoute) -> Void) {
        
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error {
                print("DEBUG: \(error)")
                
                return
            }
            
            guard let route = response?.routes.first else {return}
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
        
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime : Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        pickupTime = formatter.string(from: Date())
        dropoffTime = formatter.string(from: Date() + expectedTravelTime)
        
        
    }

}


extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
