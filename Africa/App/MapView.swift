//
//  MapView.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        // Coordinates of the map
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        // Zoom level of the map
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        // Map region with coordinates and Zoom level
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // MARK: - Basic Map
        // Map(coordinateRegion: $region)
        
        // MARK: - Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) Pin: Old style (always static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) Marker: New style (always static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) Custom Basic Annotation (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: MapAnnotation
        })
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
