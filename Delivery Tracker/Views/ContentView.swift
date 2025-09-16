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
                HStack {
                    VStack{
                        Text("60")
                            .font(.headline)
                        Text("LIMIT")
                            .font(.caption2)
                    }
                    .padding(.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .background(.ultraThinMaterial)
                    .cornerRadius(4)
                    
                    Spacer()
                    
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
                
                Spacer()
                
                HStack {
                    Button("Start Tracking") { }
                        .buttonStyle(.borderedProminent)
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
