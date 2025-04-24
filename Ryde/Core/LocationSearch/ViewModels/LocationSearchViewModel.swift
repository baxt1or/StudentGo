import SwiftUI
import MapKit
import Foundation

class LocationSearchViewModel : NSObject, ObservableObject {
    
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectLocationCoordinate : CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment : String = "" {
        didSet {

            searchCompleter.queryFragment = queryFragment
        }
    }
    
    
    
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
   }
    
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        
        locationSearch(forLocalSeachCompletion: localSearch) {response, error  in
            
            if let error = error{
                print("Error")
                
                return
            }
            
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            self.selectLocationCoordinate = coordinate
            print("DEBUD: \(coordinate)")
        }

    }
    
    func locationSearch(forLocalSeachCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
}


extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
