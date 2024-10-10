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
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewAction = true
            } label: {
                Text("Restart")
            }
        } //: VSTACK
    }
}
