//
//  VerbGameViewModel.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import Foundation

@Observable
class VerbGameViewModel {
    // MARK: - Properties
    
    var currentVerb: FrenchVerb?
    var currentPronoun: Pronoun?
    var currentTense: Tense = .present
    var userInput = ""
    var feedback = ""
    var isCorrect: Bool?
    var score = 0
    var totalQuestions = 0
    var isShowingFeedback = false
    
    var accuracyPercentage: Int {
        guard totalQuestions > 0 else { return 0 }
        return Int((Double(score) / Double(totalQuestions)) * 100)
    }
    
    // MARK: - Initialization
    
    init() {
        loadNewQuestion()
    }
    
    // MARK: - Public Methods
    
    func loadNewQuestion() {
        currentVerb = frenchVerbs.randomElement()
        currentPronoun = currentVerb?.allowedPronouns.randomElement()
        currentTense = Tense.allCases.randomElement() ?? .present
        userInput = ""
        feedback = ""
        isCorrect = nil
        isShowingFeedback = false
    }
    
    func checkAnswer() {
        guard let verb = currentVerb, let pronoun = currentPronoun else { return }
        
        let correctAnswer = verb.conjugation(for: pronoun, tense: currentTense)
        let bareForm = stripPronouns(from: correctAnswer).lowercased()
        let normalizedUserInput = stripPronouns(from: userInput).lowercased()
        
        let isAnswerCorrect = normalizedUserInput == bareForm
        
        isCorrect = isAnswerCorrect
        totalQuestions += 1
        
        if isAnswerCorrect {
            feedback = "✓ Correct! \(userInput.trimmingCharacters(in: .whitespaces)) is the right answer."
            score += 1
        } else {
            feedback = "✗ Incorrect. The correct answer is: \(bareForm)"
        }
        
        isShowingFeedback = true
    }
    
    func nextQuestion() {
        loadNewQuestion()
    }
    
    // MARK: - Private Helpers
    
    private func stripPronouns(from text: String) -> String {
        // Normalize case and whitespace first
        var s = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Known pronoun prefixes (include contracted and combined forms)
        let pronounPrefixes = [
            "il/elle/on ", "ils/elles ",
            "j'", "je ", "tu ",
            "il ", "elle ", "on ",
            "nous ", "vous ",
            "ils ", "elles "
        ]

        // Remove any matching leading pronoun
        for p in pronounPrefixes {
            if s.hasPrefix(p) {
                s.removeFirst(p.count)
                break
            }
        }

        // If we removed a contracted form like j', ensure we don't leave a leading apostrophe
        while s.hasPrefix("'") { s.removeFirst() }

        // Collapse multiple spaces inside and trim again
        s = s.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
             .trimmingCharacters(in: .whitespacesAndNewlines)

        return s
    }
}
