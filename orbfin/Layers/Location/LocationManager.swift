import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    public static let instance = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    @Published var locations: [CLLocation] = []
    @Published var location: Coordinates?
    @Published var region: MKCoordinateRegion? = nil
    
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
            self.location = Coordinates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
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
}
