//
//  TopicCard.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct TopicCard: View {
    let title: String
    let subtitle: String
    let gradientColors: [Color]
    let iconName: String
    let time: String
    
    var body: some View {
        ZStack {
            // Background Gradient
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack(alignment: .leading, spacing: 16) {
                // Top Row: Icon + Text + Arrow
                HStack(alignment: .top) {
                    Image(systemName: iconName)
                        .font(.largeTitle)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        Text(subtitle)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                // Middle Row: Learning Path
                HStack(spacing: 8) {
                    Label("Learn", systemImage: "book.fill")
                    Text("→")
                    Label("Visualize", systemImage: "eye.fill")
                    Text("→")
                    Label("Check", systemImage: "checkmark.circle.fill")
                }
                .font(.caption2)
                .fontWeight(.bold)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial.opacity(0.3)) // Glass effect
                .cornerRadius(20)
                .foregroundStyle(.white)
                
                // Bottom Row: Time
                HStack {
                    Image(systemName: "clock")
                    Text(time)
                    Text("•")
                    Image(systemName: "square.grid.2x2")
                    Text("Interactive Module")
                }
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.white.opacity(0.8))
            }
            .padding(20)
        }
        .frame(height: 180)
    }
}
