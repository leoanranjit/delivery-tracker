//
//  TrackingViewModel.swift
//  Delivery Tracker
//
//  Created by Leoan Ranjit on 9/16/25.
//

import SwiftUI
import Combine
import CoreLocation
import MapKit

class TrackingViewModel: ObservableObject {
    @Published var latitude: String = "-"
    @Published var longitude: String = "-"
    @Published var totalDistance: Double = 0.0
    @Published var statusIcon: String = "figure.stand"
    @Published var overSpeeding: Bool = false
    @Published var region = MKCoordinateRegion()
    
    @Published var isTracking = false {
        didSet {
            isTracking ? stopTracking() : startTracking()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    private var lastLocation: CLLocation?
    
    private let locationManager = LocationManager()
    
    init() {
        locationManager.requestPermission()
        locationManager.start()
        locationManager.publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                self?.update(with: location)
            }
            .store(in: &cancellables)
    }
    
    func startTracking() {
        totalDistance = 0
        lastLocation = nil
    }
    
    func stopTracking() {
        statusIcon = "figure.stand"
    }
    
    private func update(with location: CLLocation) {
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude),
            span: region.span
        )
        
        guard isTracking else { return }
        
        latitude = String(format: "%.5f", location.coordinate.latitude)
        longitude = String(format: "%.5f", location.coordinate.longitude)
        
        if let last = lastLocation {
            let distance = location.distance(from: last)
            totalDistance += distance
        }
        lastLocation = location
        
        let speedKmh = max(location.speed, 0) * 3.6
        if speedKmh > 15 {
            statusIcon = "car"
        } else if speedKmh > 7 {
            statusIcon = "figure.run"
        } else if speedKmh > 3 {
            statusIcon = "figure.walk"
        } else {
            statusIcon = "figure.stand"
        }
        
        if speedKmh > 5 {
            overSpeeding = true
        } else {
            overSpeeding = false
        }
    }
}
