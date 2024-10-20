//
//  HomeView.swift
//  Restart
//
//  Created by Pichborith Kong on 10/9/24.
//

import SwiftUI

#Preview {
    HomeView()
}

struct HomeView: View {
    // MARK: - PROPERTIES

    @AppStorage("onboarding") var isOnboardingViewAction: Bool = false // This is not declare, it set value to "true" in case "onboarding" key doesn't exist

    @State private var isAnimating: Bool = false

    // MARK: BODY

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // MARK: - HEADER

            ZStack {
                CircleGroupView(shapeColor: Color(.gray), shapeOpacity: 0.1, isAnimating: $isAnimating)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).delay(3.0).repeatForever(), value: isAnimating)
            }

            // MARK: - CENTER

            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            // MARK: - FOOTER

            Button {
                isOnboardingViewAction = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                isAnimating = true
//            }
            isAnimating = true
        }
    }
}
