//
//  TheoryCardsView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct TheoryCardsView: View {
    @Environment(\.dismiss) var dismiss
    
    // Load data from your Model
    let cards: [TheoryCard] = TheoryData.stackCards
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // 1. Vertical Paging ScrollView
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(cards) { card in
                        TheoryCardCell(card: card)
                            .containerRelativeFrame(.vertical) // Forces full screen height
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            
            // 2. Close Button (Top Left)
            VStack {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

// Sub-view for a single card layout
struct TheoryCardCell: View {
    let card: TheoryCard
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // Icon
            Image(systemName: card.iconName)
                .font(.system(size: 80))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(card.isBridge ? .green : .blue)
            
            // Text Content
            VStack(spacing: 16) {
                Text(card.title)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                
                Text(card.bodyText)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            // BRIDGE LOGIC: Only the last card shows the button
            if card.isBridge {
                NavigationLink(destination: StackVisualizerView()) {
                    HStack {
                        Text("👉 See it in Action")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                }
            } else {
                // Hint to swipe up
                Image(systemName: "chevron.compact.down")
                    .foregroundStyle(.gray.opacity(0.5))
                    .padding(.bottom, 50)
            }
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    TheoryCardsView()
}
