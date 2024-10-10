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
    
    @AppStorage("onboarding") var isOnboardingViewAction: Bool = true // This is not declare, it set value to "true" in case "onboarding" key doesn't exist
    
    // MARK: BODY
    
    var body: some View {
        VStack {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewAction = false
            } label: {
                Text("Start")
            }
        } //: VSTACK
    }
}
