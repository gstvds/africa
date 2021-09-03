//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Gustavo Silva on 28/08/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	// MARK: - Properties
	var videoSelected: String
	var videoTitle: String
	
	// MARK: - Body
	var body: some View {
		VStack {
			VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
				//                Text(videoTitle)
			} //: VideoPlayer
			.overlay(
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
					.padding(.top, 8)
					.padding(.horizontal, 8)
				, alignment: .topLeading
			)
		} //: VStack
		.accentColor(.accentColor)
		.navigationBarTitle(videoTitle, displayMode: .inline)
	}
}

// MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
		} //: NavigationView
	}
}
