//
//  OnboardingView.swift
//  Restart
//
//  Created by Pichborith Kong on 10/9/24.
//

import SwiftUI

#Preview {
    OnboardingView()
}

struct OnboardingView: View {
    // MARK: - PROPERTIES

    // This is not declare, it set value to "true" in case "onboarding" key doesn't exist
    @AppStorage("onboarding") var isOnboardingViewAction: Bool = true

    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0

    // MARK: BODY

    var body: some View {
        ZStack {
            Color(.customBlue)
                .ignoresSafeArea(.all, edges: .all)

            VStack(spacing: 20) {
                Spacer()

                // MARK: - HEADER

                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)

                    Text("""
                    It's not how much we given but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER

                // MARK: - CENTER

                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER

                Spacer()

                // MARK: - FOOTER

                ZStack {
                    // PARTS OF THE CUSTOM BUTTON

                    // 1. BACKGROUND (STATIC)

                    Capsule()
                        .fill(.white.opacity(0.2))

                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)

                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)

                    // 3. CAPSULE (DYNAMIC WIDTH)

                    HStack {
                        Capsule()
                            .fill(.customRed)
                            .frame(width: buttonOffset + 80)

                        Spacer()
                    }
                    // 4. CIRCLE (DRAGGABLE)

                    HStack {
                        ZStack {
                            Circle()
                                .fill(.customRed)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)

                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        // First Condition: It will only run when the dragging has been started in the right direction (from left to right direction)
                                        // Second Condition: It prevent button to go outside the Zstack
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffset >= buttonWidth * 0.60 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewAction = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                        ) //: GESTURE

                        Spacer()
                    }
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
            } //: VSTACK
        } //: ZSTACK
    }
}
