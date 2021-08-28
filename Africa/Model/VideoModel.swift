//
//  VideoModel.swift
//  Africa
//
//  Created by Gustavo Silva on 28/08/21.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
