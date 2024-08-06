import CoreLocation
import MapKit
import SwiftUI

@MainActor
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    public static let instance = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    @Published var locations: [CLLocation] = []
    @Published var location: CLLocationCoordinate2D?
    @Published var region: MKCoordinateRegion? = nil
    @Published var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locations = locations

        if let location = locations.last {
            self.location = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        checkLocationAuthorization()
    }
    
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("Location authorization status: Not Determined")
            return locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location authorization status: Restricted")
            print("Your location is restricted.")
            return
        case .denied:
            print("Location authorization status: Denied")
            print("You have denied the app location permission.")
            return
        case .authorizedAlways:
            print("Location authorization status: Authorized Always")
            return locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("Location authorization status: Authorized When In Use")
            return locationManager.startUpdatingLocation()
        @unknown default:
            print("Location authorization status: Unknown")
            return
        }
    }
    
    func getCoordinates(address: String?) async -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        
        if let address {
            if let coordinates2D = try? await geocoder.geocodeAddressString(address).first?.location?.coordinate {
                return coordinates2D
            } else {
                return CLLocationCoordinate2D()
            }
        }
        
       return CLLocationCoordinate2D()
    }
    
    func changeCamera(coordinates: CLLocationCoordinate2D) {
        self.position = .region(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
}
