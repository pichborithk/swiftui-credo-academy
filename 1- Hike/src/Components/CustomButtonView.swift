//
//  CustomButtonView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

#Preview {
    CustomButtonView()
}

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [.colorGreenLight, .colorGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom))

            Circle()
                .stroke(LinearGradient(
                    colors: [.colorGrayLight, .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom),
                lineWidth: 4)

            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(
                    colors: [.colorGrayLight, .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom))
        } //: ZSTACK
        .frame(width: 58, height: 58)
    }
}
