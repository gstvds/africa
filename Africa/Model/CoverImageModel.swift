//
//  CoverImageModel.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import SwiftUI

// Codable to parse JSON, identifiable to use IDs
struct CoverImage: Codable, Identifiable {
	let id: Int
	let name: String
}
