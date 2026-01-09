//
//  RootView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//
import SwiftUI

struct RootView: View {
    @State private var hasOnboarded: Bool = false
    
    var body: some View {
        if hasOnboarded {
            NavigationStack {
                DashboardView()
            }
            .preferredColorScheme(.dark)
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    RootView()
}
