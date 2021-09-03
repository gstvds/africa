//
//  GalleryView.swift
//  Africa
//
//  Created by Gustavo Silva on 27/08/21.
//

import SwiftUI

struct GalleryView: View {
	// MARK: - Properties
	@State private var selectedAnimal: String = "lion"
	@State private var gridLayout: Array<GridItem> = [GridItem(.flexible())]
	@State private var gridColumn: Double = 3.0
	let animals: Array<Animal> = Bundle.main.decode("animals.json")
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	// Simple grid definition
	// let gridLayout: Array<GridItem> = [
	//     GridItem(.flexible()),
	//     GridItem(.flexible()),
	//     GridItem(.flexible())
	// ]
	// Efficient grid definition
	// let gridLayout: Array<GridItem> = Array(repeating: GridItem(.flexible()), count: 3)
	// Dynamic grid layout
	
	// MARK: - Functions
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
	}
	
	// MARK: - Body
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 30) {
				Image(selectedAnimal)
					.resizable()
					.scaledToFit()
					.clipShape(Circle())
					.overlay(
						Circle().stroke(Color.white, lineWidth: 1)
					) //: overlay
				
				Slider(value: $gridColumn, in: 2...4, step: 1)
					.padding(.horizontal)
					.onChange(of: gridColumn, perform: { value in
						gridSwitch()
					}) //: onChange
				
				LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
					ForEach(animals) { item in
						Image(item.image)
							.resizable()
							.scaledToFit()
							.clipShape(Circle())
							.overlay(
								Circle().stroke(Color.white, lineWidth: 1)
							) //: overlay
							.onTapGesture {
								selectedAnimal = item.image
								haptics.impactOccurred()
							} //: onTapGesture
					} //: ForEach
				} //: LazyVGrid
				.animation(.easeIn)
				.onAppear(perform: {
					gridSwitch()
				}) //: onAppear
			} //: VStack
			.padding(.horizontal, 10)
			.padding(.vertical, 50)
		} //: ScrollView
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView())
	}
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
