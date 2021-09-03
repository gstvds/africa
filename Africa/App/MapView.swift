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
		Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
			MapAnnotation(coordinate: item.location) {
				MapAnnotationView(location: item)
			} //: MapAnnotation
		}) //: Map
			.overlay(
				HStack {
					Image("compass")
						.resizable()
						.scaledToFit()
						.frame(width: 48, height: 48, alignment: .center)
					VStack(alignment: .leading, spacing: 3) {
						HStack {
							Text("Latitude")
								.font(.footnote)
								.fontWeight(.bold)
								.foregroundColor(.accentColor)
							Spacer()
							Text("\(region.center.latitude)")
								.font(.footnote)
								.foregroundColor(.white)
						} //: HStack
						HStack {
							Text("Longitude")
								.font(.footnote)
								.fontWeight(.bold)
								.foregroundColor(.accentColor)
							Spacer()
							Text("\(region.center.longitude)")
								.font(.footnote)
								.foregroundColor(.white)
						} //: HStack
						Divider()
					} //: VStack
				} //: HStack
					.padding(.vertical, 12)
					.padding(.horizontal, 16)
					.background(Color.black.cornerRadius(8).opacity(0.6))
					.padding()
				, alignment: .top
			) //: overlay
	} //: body
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
	}
}
