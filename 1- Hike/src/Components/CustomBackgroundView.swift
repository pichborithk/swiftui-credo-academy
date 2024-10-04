//
//  CardBackgroundView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

#Preview {
    CustomBackgroundView()
}

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH

            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)

            // MARK: - 2. LIGHT

            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)

            // MARK: - 3. SURFACE

            LinearGradient(colors: [.colorGreenLight, .colorGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}
