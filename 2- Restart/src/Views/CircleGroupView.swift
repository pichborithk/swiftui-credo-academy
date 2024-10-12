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

        CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
    }
}

struct CircleGroupView: View {
    // MARK: - PROPERTIES

    var shapeColor: Color
    var shapeOpacity: Double

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
    }
}
