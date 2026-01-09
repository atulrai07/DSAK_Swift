//
//  TheoryCard.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//
import SwiftUI

// 1. The Data Structure
struct TheoryCard: Identifiable {
    let id = UUID()
    let title: String
    let bodyText: String
    let iconName: String
    let isBridge: Bool // Marks the final "Transition" card to the visualizer
}

// 2. The Static Content (Data Source)
struct TheoryData {
    // The content for the "Stack" topic
    static let stackCards: [TheoryCard] = [
        // Card 1
        TheoryCard(
            title: "What is a Stack?",
            bodyText: "A Stack is a linear data structure where the last element added is the first one removed.",
            iconName: "square.stack.3d.up.fill",
            isBridge: false
        ),
        // Card 2
        TheoryCard(
            title: "LIFO Mental Model",
            bodyText: "Think of a stack of plates.\n\nYou can only remove the plate on the top.",
            iconName: "arrow.up.arrow.down",
            isBridge: false
        ),
        // Card 3
        TheoryCard(
            title: "Core Operations",
            bodyText: "Push → Add element to the top\nPop → Remove the top element",
            iconName: "plus.forwardslash.minus",
            isBridge: false
        ),
        // Card 4
        TheoryCard(
            title: "Why Stacks Matter",
            bodyText: "Used in function calls (recursion), undo/redo features, and expression evaluation.",
            iconName: "function",
            isBridge: false
        ),
        // Card 5 (The Bridge)
        TheoryCard(
            title: "Time to Build",
            bodyText: "You understand the idea.\n\nNow let’s see how a Stack behaves—and how it’s written in Java code.",
            iconName: "swift",
            isBridge: true
        )
    ]
}
