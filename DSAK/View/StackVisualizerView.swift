//
//  StackVisualizerView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct StackVisualizerView: View {
    @Environment(\.dismiss) var dismiss
    
    // State for the Visual Stack Items
    @State private var stackItems: [Int] = []
    
    // State for the "Reactive Code"
    @State private var codeSnippet: String = "Stack<Integer> stack = new Stack<>();"
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 1. Header with Back Button
            HStack {
                Button(action: { dismiss() }) {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundStyle(.blue)
                }
                Spacer()
                Text("Stack Visualizer")
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                // Balancing spacer
                Color.clear.frame(width: 60)
                
                // In StackVisualizerView header
                NavigationLink(destination: StackQuizView()) {
                    Text("Next")
                        .bold()
                }
            }
            .padding()
            
            // 2. VISUALIZATION AREA (Top)
            ZStack(alignment: .bottom) {
                // The "Container" box
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.gray.opacity(0.3), lineWidth: 2)
                    .frame(width: 140, height: 350)
                    .background(Color.black)
                
                // The Stacked Blocks
                VStack(spacing: 4) {
                    ForEach(stackItems.reversed(), id: \.self) { item in
                        Text("\(item)")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 50)
                            .background(
                                LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(8)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                }
                .padding(.bottom, 10)
                // Smooth spring animation for physics feel
                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: stackItems)
            }
            .frame(maxHeight: .infinity)
            
            // 3. CONTROLS (Middle)
            HStack(spacing: 50) {
                // POP Button
                Button(action: popItem) {
                    VStack {
                        Image(systemName: "arrow.up.circle")
                            .font(.system(size: 44))
                        Text("Pop")
                            .font(.caption)
                            .bold()
                    }
                    .foregroundStyle(stackItems.isEmpty ? .gray : .red)
                }
                .disabled(stackItems.isEmpty)
                
                // PUSH Button
                Button(action: pushItem) {
                    VStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.system(size: 54))
                        Text("Push")
                            .font(.caption)
                            .bold()
                    }
                    .foregroundStyle(stackItems.count >= 6 ? .gray : .blue)
                }
                .disabled(stackItems.count >= 6)
            }
            .padding(.vertical, 20)
            
            // 4. REACTIVE CODE INSIGHT (Bottom)
            VStack(alignment: .leading, spacing: 8) {
                Text("JAVA CODE INSIGHT")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                HStack {
                    Text(codeSnippet)
                        .font(.system(.body, design: .monospaced)) // Monospace for code look
                        .foregroundStyle(.green)
                        .contentTransition(.numericText()) // Smooth text updates
                    Spacer()
                }
                .padding()
                .background(Color(uiColor: .secondarySystemBackground).opacity(0.1))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarHidden(true)
    }
    
    // MARK: - Logic Functions
    
    func pushItem() {
        // Limit stack size to 6 for UI purposes
        guard stackItems.count < 6 else { return }
        
        let newValue = Int.random(in: 10...99)
        stackItems.append(newValue)
        
        // Update Code Snippet
        withAnimation {
            codeSnippet = "stack.push(\(newValue));"
        }
    }
    
    func popItem() {
        guard !stackItems.isEmpty else { return }
        
        _ = stackItems.popLast()
        
        // Update Code Snippet
        withAnimation {
            codeSnippet = "stack.pop();"
        }
    }
}

#Preview {
    StackVisualizerView()
}
