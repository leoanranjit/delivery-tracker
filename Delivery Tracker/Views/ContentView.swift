//
//  ContentView.swift
//  Delivery Tracker
//
//  Created by Leoan Ranjit on 9/16/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Map()
            VStack(spacing: 12) {
                VStack(spacing: 6) {
                    Text("Latitude: 24.123121")
                    Text("Longitude: 24.123121")
                    Text("Distance: \(10, specifier: "%.2f") m")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .shadow(radius: 4)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
