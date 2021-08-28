//
//  VideoListView.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    } //: NavigationLink
                } //: ForEach
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    } //: Button
                } //: ToolbarItem
            } //: toolbar
        } //: NavigationView
    }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
