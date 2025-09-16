//
//  LocationManager.swift
//  Delivery Tracker
//
//  Created by Leoan Ranjit on 9/16/25.
//

import SwiftUI
import Combine
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    private let subject = PassthroughSubject<CLLocation, Never>()

    var publisher: AnyPublisher<CLLocation, Never> {
        subject.eraseToAnyPublisher()
    }
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 10
    }
    
    func requestPermission() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
    
    func start() {
        manager.startUpdatingLocation()
    }
    
    func stop() {
        manager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.last else { return }
        print(latest)
        subject.send(latest)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("Authorization status: \(manager.authorizationStatus.rawValue)")
    }
}


