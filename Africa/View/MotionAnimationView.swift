//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Gustavo Silva on 29/08/21.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - Functions
    // (1) Random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // (2) Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    // (3) Random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // (4) Random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    // (5) Random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        ) //: animation
                        .onAppear(perform: {
                            isAnimating = true
                        }) //: onAppear
                } //: ForEach
            } //: ZStack
            .drawingGroup()
        } //: GeometryReader
    }
}

// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
