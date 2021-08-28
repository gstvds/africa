//
//  CoverImageView.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Image("cover-lion")
                    .resizable()
                    .scaledToFill()
            } //: ForEach
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
    
    // MARK: - Preview
    
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
