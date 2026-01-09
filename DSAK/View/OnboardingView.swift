//
//  OnboardingView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var hasOnboarded: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("Welcome to App")
                .font(.largeTitle)
                .bold()
            
            // Illustration Placeholder
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .systemGray6))
                .frame(height: 200)
                .overlay {
                    Image(systemName: "photo")
                        .font(.system(size: 60))
                        .foregroundStyle(.gray)
                }
                .padding(.vertical, 20)
            
            // Features
            VStack(alignment: .leading, spacing: 30) {
                FeatureRow(icon: "doc.text.fill", title: "Quick Concepts", desc: "Master core ideas in 5-10 minutes.")
                FeatureRow(icon: "rectangle.stack.fill", title: "Scrollable Cards", desc: "Swipe through bite-sized lessons.")
                FeatureRow(icon: "checkmark.circle.fill", title: "Self-Check Quizzes", desc: "Confirm your understanding.")
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            Button(action: {
                withAnimation { hasOnboarded = true }
            }) {
                Text("Get started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(16)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Text("Log in")
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
            }
            .font(.footnote)
            .padding(.bottom, 20)
        }
        .padding()
    }
}
