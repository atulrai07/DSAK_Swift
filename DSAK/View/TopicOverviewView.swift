//
//  TopicOverviewView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

//
//  TopicOverviewView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct TopicOverviewView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Custom Navigation Header
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Topic Overview")
                    }
                    .foregroundStyle(.blue)
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Stack")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(.white)
                        
                        Text("Last In, First Out (LIFO)")
                            .font(.body)
                            .foregroundStyle(.gray)
                    }
                    
                    // Steps
                    VStack(spacing: 16) {
                        OverviewStepRow(
                            number: "1",
                            title: "Learn the core idea",
                            desc: "Short, swipeable cards that explain how Stack works."
                        )
                        
                        OverviewStepRow(
                            number: "2",
                            title: "See it in action",
                            desc: "Interactive visualization where you push & pop elements."
                        )
                        
                        OverviewStepRow(
                            number: "3",
                            title: "Check your understanding",
                            desc: "3 quick questions to confirm you're ready."
                        )
                    }
                    
                    // Time & Goal
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "clock")
                            Text("Estimated time: 5 minutes")
                        }
                        
                        HStack(alignment: .top) {
                            Image(systemName: "target")
                            Text("Goal: Understand Stack well enough to start coding")
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
                    
                    Spacer(minLength: 30)
                    
                    // Navigation Button
                    NavigationLink {
                        // FIX: Removed (cards: ...) because TheoryCardsView loads data internally
                        TheoryCardsView()
                    } label: {
                        Text("Start Learning")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                    }
                }
            }
        }
        .padding(.horizontal)
        .background(Color.black.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        TopicOverviewView()
    }
}
