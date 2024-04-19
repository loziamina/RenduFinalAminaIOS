//
//  FormTestView.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation
import SwiftUI
import CoreData


struct FormTestView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int?
    @State private var showingScore = false
    @State private var score = 0

    let model = Model()

    var body: some View {
        NavigationView {
            VStack {
                if currentQuestionIndex < model.questions.count {
                    let question = model.questions[currentQuestionIndex]

                    Text(question.statement)
                        .font(.title)
                        .padding()

                    ForEach(0..<question.proposal.count, id: \.self) { index in
                        Button(action: {
                            selectedAnswerIndex = index
                        }) {
                            Text(question.proposal[index])
                                .foregroundColor(.white)
                                .padding()
                                .background(selectedAnswerIndex == index ? Color.blue : Color.gray)
                                .cornerRadius(10)
                        }
                        .padding(5)
                    }

                    Button("Submit") {
                        if let selectedAnswerIndex = selectedAnswerIndex {
                            if selectedAnswerIndex == question.answer.rawValue - 1 {
                                score += 1
                            }
                            if currentQuestionIndex < model.questions.count - 1 {
                                currentQuestionIndex += 1
                                self.selectedAnswerIndex = nil
                            } else {
                                showingScore = true
                            }
                        }
                    }
                    .padding()
                    .disabled(selectedAnswerIndex == nil)
                } else {
                    Text("Quiz Completed")
                    Text("Score: \(score) out of \(model.questions.count)")
                        .font(.headline)
                }
            }
            .navigationBarTitle("Quiz", displayMode: .inline)
            .alert(isPresented: $showingScore) {
                Alert(
                    title: Text("Quiz Complete"),
                    message: Text("Your score is \(score) out of \(model.questions.count)."),
                    dismissButton: .default(Text("OK")) {
                        currentQuestionIndex = 0
                        score = 0
                        showingScore = false
                    }
                )
            }
        }
    }
}



#Preview {
    FormTestView()
}
