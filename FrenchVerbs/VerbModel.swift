//
//  VerbModel.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import Foundation

struct FrenchVerb {
    let infinitive: String
    let englishMeaning: String
    let conjugations: VerbConjugations
}

struct VerbConjugations {
    let je: String
    let tu: String
    let il: String
    let nous: String
    let vous: String
    let ils: String

    var all: [String] {
        [je, tu, il, nous, vous, ils]
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

// Sample French verbs with present tense conjugations
let frenchVerbs: [FrenchVerb] = [
    FrenchVerb(
        infinitive: "être",
        englishMeaning: "to be",
        conjugations: VerbConjugations(je: "suis", tu: "es", il: "est", nous: "sommes", vous: "êtes", ils: "sont")
    ),
    FrenchVerb(
        infinitive: "avoir",
        englishMeaning: "to have",
        conjugations: VerbConjugations(je: "ai", tu: "as", il: "a", nous: "avons", vous: "avez", ils: "ont")
    ),
    FrenchVerb(
        infinitive: "aller",
        englishMeaning: "to go",
        conjugations: VerbConjugations(je: "vais", tu: "vas", il: "va", nous: "allons", vous: "allez", ils: "vont")
    ),
    FrenchVerb(
        infinitive: "parler",
        englishMeaning: "to speak",
        conjugations: VerbConjugations(je: "parle", tu: "parles", il: "parle", nous: "parlons", vous: "parlez", ils: "parlent")
    ),
    FrenchVerb(
        infinitive: "manger",
        englishMeaning: "to eat",
        conjugations: VerbConjugations(je: "mange", tu: "manges", il: "mange", nous: "mangeons", vous: "mangez", ils: "mangent")
    ),
    FrenchVerb(
        infinitive: "boire",
        englishMeaning: "to drink",
        conjugations: VerbConjugations(je: "bois", tu: "bois", il: "boit", nous: "buvons", vous: "buvez", ils: "boivent")
    ),
    FrenchVerb(
        infinitive: "faire",
        englishMeaning: "to do/make",
        conjugations: VerbConjugations(je: "fais", tu: "fais", il: "fait", nous: "faisons", vous: "faites", ils: "font")
    ),
    FrenchVerb(
        infinitive: "voir",
        englishMeaning: "to see",
        conjugations: VerbConjugations(je: "vois", tu: "vois", il: "voit", nous: "voyons", vous: "voyez", ils: "voient")
    ),
    FrenchVerb(
        infinitive: "pouvoir",
        englishMeaning: "can/to be able",
        conjugations: VerbConjugations(je: "peux", tu: "peux", il: "peut", nous: "pouvons", vous: "pouvez", ils: "peuvent")
    ),
    FrenchVerb(
        infinitive: "vouloir",
        englishMeaning: "to want",
        conjugations: VerbConjugations(je: "veux", tu: "veux", il: "veut", nous: "voulons", vous: "voulez", ils: "veulent")
    ),
    FrenchVerb(
        infinitive: "devoir",
        englishMeaning: "must/to have to",
        conjugations: VerbConjugations(je: "dois", tu: "dois", il: "doit", nous: "devons", vous: "devez", ils: "doivent")
    ),
    FrenchVerb(
        infinitive: "savoir",
        englishMeaning: "to know",
        conjugations: VerbConjugations(je: "sais", tu: "sais", il: "sait", nous: "savons", vous: "savez", ils: "savent")
    ),
    FrenchVerb(
        infinitive: "vivre",
        englishMeaning: "to live",
        conjugations: VerbConjugations(je: "vis", tu: "vis", il: "vit", nous: "vivons", vous: "vivez", ils: "vivent")
    ),
    FrenchVerb(
        infinitive: "venir",
        englishMeaning: "to come",
        conjugations: VerbConjugations(je: "viens", tu: "viens", il: "vient", nous: "venons", vous: "venez", ils: "viennent")
    ),
    FrenchVerb(
        infinitive: "prendre",
        englishMeaning: "to take",
        conjugations: VerbConjugations(je: "prends", tu: "prends", il: "prend", nous: "prenons", vous: "prenez", ils: "prennent")
    ),
]
