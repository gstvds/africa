//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import Foundation

extension Bundle {
    // With the underscore we don't have to enter the parameter name on each call of the func
    func decode<T: Codable>(_ file: String) -> [T] {
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locale \(file) in bundle")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // 3. Create a decoder
        let decoder = JSONDecoder()
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // 5. Return the ready-to-use data
        return loaded
    } //: decode

}
