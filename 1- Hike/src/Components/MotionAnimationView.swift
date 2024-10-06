//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

#Preview {
    ZStack {
        MotionAnimationView()
            .background(Circle().fill(Color.teal))
    }
}

struct MotionAnimationView: View {
    // MARK: - PROPERTIES

    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false

    // MARK: - FUNCTIONS

    func randomCoordinates() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }

    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }

    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }

    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { _ in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinates(), y: randomCoordinates())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    }
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}
