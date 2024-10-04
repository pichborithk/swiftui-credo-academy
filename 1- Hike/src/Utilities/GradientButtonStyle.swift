//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Nil Coalescing
                configuration.isPressed
                    ? LinearGradient(
                        colors: [.colorGrayMedium, .colorGrayLight],
                        startPoint: .top,
                        endPoint: .bottom)
                    : LinearGradient(
                        colors: [.colorGrayLight, .colorGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
