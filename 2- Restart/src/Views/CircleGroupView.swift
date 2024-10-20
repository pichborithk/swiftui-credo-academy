//
//  CircleGroupView.swift
//  Restart
//
//  Created by Pichborith Kong on 10/11/24.
//

import SwiftUI

// MARK: PREVIEW

#Preview {
    ZStack {
        Color.customBlue
            .ignoresSafeArea()

        CircleGroupView(shapeColor: .white, shapeOpacity: 0.2, isAnimating: .constant(true))
    }
}

struct CircleGroupView: View {
    // MARK: - PROPERTIES

    var shapeColor: Color
    var shapeOpacity: Double
    @Binding var isAnimating: Bool

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1: 0)
        .scaleEffect(isAnimating ?1  : 0.5)
        .animation(.easeInOut(duration: 1), value: isAnimating)
    }
}
