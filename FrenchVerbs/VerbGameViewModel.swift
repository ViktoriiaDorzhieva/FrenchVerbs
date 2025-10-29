//
//  VerbGameViewModel.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import Foundation

@Observable
class VerbGameViewModel {
    var currentVerb: FrenchVerb?
    var currentPronoun: Pronoun?
    var userInput: String = ""
    var feedback: String = ""
    var isCorrect: Bool? = nil
    var score: Int = 0
    var totalQuestions: Int = 0
    var isShowingFeedback: Bool = false

    init() {
        loadNewQuestion()
    }

    func loadNewQuestion() {
        currentVerb = frenchVerbs.randomElement()
        currentPronoun = Pronoun.allCases.randomElement()
        userInput = ""
        feedback = ""
        isCorrect = nil
        isShowingFeedback = false
    }

    func checkAnswer() {
        guard let verb = currentVerb, let pronoun = currentPronoun else { return }

        let correct = getCorrectConjugation(for: verb, pronoun: pronoun)
        let userAnswer = userInput.trimmingCharacters(in: .whitespaces).lowercased()
        let isAnswerCorrect = userAnswer == correct.lowercased()

        isCorrect = isAnswerCorrect
        totalQuestions += 1

        if isAnswerCorrect {
            score += 1
            feedback = "✓ Correct! \(userAnswer) is the right answer."
        } else {
            feedback = "✗ Incorrect. The correct answer is: \(correct)"
        }

        isShowingFeedback = true
    }

    func getCorrectConjugation(for verb: FrenchVerb, pronoun: Pronoun) -> String {
        switch pronoun {
        case .je:
            return verb.conjugations.je
        case .tu:
            return verb.conjugations.tu
        case .il:
            return verb.conjugations.il
        case .nous:
            return verb.conjugations.nous
        case .vous:
            return verb.conjugations.vous
        case .ils:
            return verb.conjugations.ils
        }
    }

    func nextQuestion() {
        loadNewQuestion()
    }

    var accuracyPercentage: Int {
        guard totalQuestions > 0 else { return 0 }
        return Int((Double(score) / Double(totalQuestions)) * 100)
    }
}
