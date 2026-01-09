//
//  CompletionView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct CompletionView: View {
    // This allows us to pop all the way back to the root if we use a binding in the future,
    // but for now we can use a simple dismiss approach or NavigationPath logic.
    // For the simplest implementation in this flow:
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // 1. Success Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 120, height: 120)
                    .blur(radius: 10)
                    .opacity(0.5)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
            }
            .padding(.bottom, 20)
            
            // 2. Confidence Text
            VStack(spacing: 12) {
                Text("You're Stack Ready")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                Text("You've mastered the concept, visualized the behavior, and verified your knowledge.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
            
            // 3. Summary Cards (Cosmetic)
            HStack(spacing: 12) {
                CompletionBadge(icon: "book.fill", text: "Concept")
                CompletionBadge(icon: "eye.fill", text: "Visuals")
                CompletionBadge(icon: "checkmark.shield.fill", text: "Quiz")
            }
            
            Spacer()
            
            // 4. Back to Topics CTA
            // Note: In a deep NavigationStack, popping to root requires a Binding or ID.
            // For this specific prototype, we will instruct the user to tap "Done"
            // or simply use the NavigationLink to dashboard approach (which pushes a new view)
            // OR use a "Pop to Root" utility.
            // Here is a simple "Finish" button that would ideally reset the state.
            
            NavigationLink(destination: DashboardView().navigationBarHidden(true)) {
                Text("Back to Topics")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(uiColor: .systemGray6).opacity(0.2))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
            }
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

// Helper Badge View
struct CompletionBadge: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.green)
            Text(text)
                .font(.caption)
                .bold()
                .foregroundStyle(.gray)
        }
        .frame(width: 90, height: 80)
        .background(Color(uiColor: .secondarySystemBackground).opacity(0.1))
        .cornerRadius(12)
    }
}
