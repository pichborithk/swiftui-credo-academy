//
//  CustomCircleView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

#Preview {
    CustomCircleView()
}

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false

    var body: some View {
        Circle()
            .fill(LinearGradient(
                colors: [.colorIndigoMedium, .colorSalmonLight],
                startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                endPoint: isAnimateGradient ? .bottomTrailing: .topLeading))
            .frame(width: 256, height: 256)
            .onAppear {
                withAnimation(.linear(duration: 3.0)
                    .repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
            }
    }
}
