//
//  CircleGroupView.swift
//  Restart
//
//  Created by Pichborith Kong on 10/11/24.
//

import SwiftUI

#Preview {
    ZStack {
        Color.customBlue
            .ignoresSafeArea()

        CircleGroupView()
    }
}

struct CircleGroupView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(.white.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}
