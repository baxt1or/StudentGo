

import SwiftUI
import MapKit

struct RydeMapViewRepresentable : UIViewRepresentable {

    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    @Binding var mapState : MapViewState
    
    @ObservedObject  var locationViewModel : LocationSearchViewModel
    
    
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
        switch mapState {
        case .noInput:
            context.coordinator.clearLocation()
            break
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectLocationCoordinate {
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyine(withDestinationCoordinate: coordinate)
            }
            break
          
        }
        
    }

    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension RydeMapViewRepresentable {
    
    class MapCoordinator : NSObject, MKMapViewDelegate {
        
        let parent : RydeMapViewRepresentable
        var userLocationCoordinate : CLLocationCoordinate2D?
        var currentRegion : MKCoordinateRegion?
        
        init(parent: RydeMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
       //  MARK: Map View Delegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            
            self.userLocationCoordinate = userLocation.coordinate
            
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            self.currentRegion = region
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let over = MKPolylineRenderer(overlay: overlay)
            over.strokeColor = .systemBlue
            over.lineWidth = 6
            return over
        }
        
        // Helper function:
                
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            parent.mapView.addAnnotation(annotation)
            parent.mapView.selectAnnotation(annotation, animated: true)
            
            let region = MKCoordinateRegion(center: coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
        
        
        func configurePolyine(withDestinationCoordinate coordinate : CLLocationCoordinate2D) {
            
            guard let userLocationCoordinate = self.userLocationCoordinate else {return}
            
            getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
                print("OVERLAY ROUTE: \(route.polyline)")
            }
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
                completion(route)
            }
            
        }
        
        
        func clearLocation(){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            
            if let currentRegion = currentRegion{
                
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }

    }
}


