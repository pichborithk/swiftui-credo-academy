//
//  TextColorGradients.swift
//  ui-demo
//
//  Created by Pichborith Kong on 9/25/24.
//

import SwiftUI

#Preview {
    TextColorGradients()
}

struct TextColorGradients: View {
    var body: some View {
        Text("iOS")
            .font(.system(size: 180))
            .fontWeight(.black)
            .foregroundStyle(
                LinearGradient(
                    colors: [.red, .purple, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
    }
}
