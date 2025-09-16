//
//  ContentView.swift
//  Delivery Tracker
//
//  Created by Leoan Ranjit on 9/16/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject private var vm = TrackingViewModel()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.region, showsUserLocation: true)
                .ignoresSafeArea()
            VStack(spacing: 12) {
                HStack(alignment: .top) {
                    VStack(spacing: 4){
                        Text("5")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("LIMIT")
                            .font(.caption2)
                            .foregroundColor(.white)
                    }
                    .padding(.init(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .background(
                        vm.overSpeeding ? Color.red : Color.black.opacity(0.7)
                    )
                    .tint(vm.overSpeeding ? .red : .black)
                    .cornerRadius(4)
                    
                    Spacer()
                    
                    if vm.isTracking {
                        VStack(spacing: 6) {
                            Text("Latitude: \(vm.latitude)")
                            Text("Longitude: \(vm.longitude)")
                            Text("Distance: \(vm.totalDistance, specifier: "%.2f") m")
                                .font(.headline)
                            Image(systemName: vm.statusIcon)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(vm.isTracking ? "Stop Tracking" : "Start Tracking") {
                        vm.isTracking.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(vm.isTracking ? Color(.systemRed) : Color(.systemBlue))   // red when tracking, blue otherwise
                    .shadow(radius: 8)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
