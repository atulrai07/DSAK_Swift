//
//  QuizQuestion.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//
import SwiftUI

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    let explanation: String
}

struct QuizData {
    static let stackQuestions: [QuizQuestion] = [
        QuizQuestion(
            question: "Which operation removes the top element of a stack?",
            options: ["Push", "Pop", "Peek", "Insert"],
            correctAnswerIndex: 1, // Pop
            explanation: "Correct! Pop removes the item that was most recently added (LIFO)."
        ),
        QuizQuestion(
            question: "Which principle does Stack follow?",
            options: ["FIFO", "LIFO", "Random", "Priority"],
            correctAnswerIndex: 1, // LIFO
            explanation: "Spot on! Last In, First Out means the last item added is the first one handled."
        ),
        QuizQuestion(
            question: "What happens if you pop an empty stack?",
            options: ["Returns 0", "Underflow / Error", "Pushes a value", "Nothing"],
            correctAnswerIndex: 1, // Underflow
            explanation: "Exactly. You cannot remove items from an empty stack, causing a Stack Underflow."
        )
    ]
}
