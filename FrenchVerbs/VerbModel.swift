//
//  VerbModel.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import Foundation

// MARK: - Models

struct FrenchVerb: Codable {
    let infinitive: String
    let englishMeaning: String
    let present: VerbConjugations
    let past: VerbConjugations
    let future: VerbConjugations
    
    var isImpersonal: Bool {
        ["falloir", "pleuvoir", "suffire"].contains(infinitive)
    }
    
    var allowedPronouns: [Pronoun] {
        isImpersonal ? [.il] : Pronoun.allCases
    }
}

struct VerbConjugations: Codable {
    let je: String
    let tu: String
    let il: String
    let nous: String
    let vous: String
    let ils: String
    
    enum CodingKeys: String, CodingKey {
        case je
        case tu
        case il = "il/elle/on"
        case nous
        case vous
        case ils = "ils/elles"
    }
    
    var allPairs: [(String, String)] {
        [
            ("je", je),
            ("tu", tu),
            ("il/elle/on", il),
            ("nous", nous),
            ("vous", vous),
            ("ils/elles", ils)
        ]
    }
}

enum Pronoun: String, CaseIterable {
    case je = "je"
    case tu = "tu"
    case il = "il/elle/on"
    case nous = "nous"
    case vous = "vous"
    case ils = "ils/elles"
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}

enum Tense: String, CaseIterable {
    case present = "Present"
    case past = "Past"
    case future = "Future"
}

// MARK: - JSON Container

private struct VerbsContainer: Codable {
    let verbs: [FrenchVerb]
}

// MARK: - Data Loading

let frenchVerbs: [FrenchVerb] = {
    guard let url = Bundle.main.url(forResource: "Conjugations", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let container = try? JSONDecoder().decode(VerbsContainer.self, from: data) else {
        print("⚠️ Failed to load verbs from JSON, using empty array")
        return []
    }
    return container.verbs
}()

// MARK: - Extensions

extension FrenchVerb {
    func conjugation(for pronoun: Pronoun, tense: Tense) -> String {
        let conjugations: VerbConjugations
        switch tense {
        case .present: conjugations = present
        case .past: conjugations = past
        case .future: conjugations = future
        }
        
        switch pronoun {
        case .je: return conjugations.je
        case .tu: return conjugations.tu
        case .il: return conjugations.il
        case .nous: return conjugations.nous
        case .vous: return conjugations.vous
        case .ils: return conjugations.ils
        }
    }
}

