//
//  ContentView.swift
//  Restart
//
//  Created by Pichborith Kong on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
        .animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
    }
}

#Preview {
    ContentView()
}
