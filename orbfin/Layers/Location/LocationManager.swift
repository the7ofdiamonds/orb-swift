import CoreLocation
import MapKit

@Observable class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static var instance = LocationManager.self
    
    private var locationManager = CLLocationManager()
    
    var locations: [CLLocation] = []
    var location: Coordinates?
    var region: MKCoordinateRegion? = nil
    
    override init() {
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
    
    func checkLocationAuthorization(){
        print("Checking location authorization status...")
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("Location authorization status: Not Determined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location authorization status: Restricted")
            print("Your location is restricted.")
        case .denied:
            print("Location authorization status: Denied")
            print("You have denied the app location permission.")
        case .authorizedAlways:
            print("Location authorization status: Authorized Always")
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("Location authorization status: Authorized When In Use")
            locationManager.startUpdatingLocation()
        @unknown default:
            print("Location authorization status: Unknown")
        }
    }
}
