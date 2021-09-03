//
//  LocationModel.swift
//  Africa
//
//  Created by Gustavo Silva on 28/08/21.
//

import SwiftUI
import MapKit

struct NationalParkLocation: Codable, Identifiable {
	let id: String
	let name: String
	let image: String
	let latitude: Double
	let longitude: Double
	
	// Computed Property
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
