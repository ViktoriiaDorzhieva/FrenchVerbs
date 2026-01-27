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
    let present: VerbConjugations
    let past: VerbConjugations // passé composé approximation
    let future: VerbConjugations // futur simple
}

struct VerbConjugations {
    let je: String
    let tu: String
    let il: String
    let nous: String
    let vous: String
    let ils: String

    var allPairs: [(String, String)] {
        return [
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

let frenchVerbs: [FrenchVerb] = [
    // Core seeded verbs with full conjugations
    FrenchVerb(
        infinitive: "être",
        englishMeaning: "to be",
        present: VerbConjugations(je: "suis", tu: "es", il: "est", nous: "sommes", vous: "êtes", ils: "sont"),
        past: VerbConjugations(je: "ai été", tu: "as été", il: "a été", nous: "avons été", vous: "avez été", ils: "ont été"),
        future: VerbConjugations(je: "serai", tu: "seras", il: "sera", nous: "serons", vous: "serez", ils: "seront")
    ),
    FrenchVerb(
        infinitive: "avoir",
        englishMeaning: "to have",
        present: VerbConjugations(je: "ai", tu: "as", il: "a", nous: "avons", vous: "avez", ils: "ont"),
        past: VerbConjugations(je: "ai eu", tu: "as eu", il: "a eu", nous: "avons eu", vous: "avez eu", ils: "ont eu"),
        future: VerbConjugations(je: "aurai", tu: "auras", il: "aura", nous: "aurons", vous: "aurez", ils: "auront")
    ),
    FrenchVerb(
        infinitive: "aller",
        englishMeaning: "to go",
        present: VerbConjugations(je: "vais", tu: "vas", il: "va", nous: "allons", vous: "allez", ils: "vont"),
        past: VerbConjugations(je: "suis allé(e)", tu: "es allé(e)", il: "est allé(e)", nous: "sommes allé(e)s", vous: "êtes allé(e)(s)", ils: "sont allé(e)s"),
        future: VerbConjugations(je: "irai", tu: "iras", il: "ira", nous: "irons", vous: "irez", ils: "iront")
    ),
    FrenchVerb(
        infinitive: "parler",
        englishMeaning: "to speak",
        present: VerbConjugations(je: "parle", tu: "parles", il: "parle", nous: "parlons", vous: "parlez", ils: "parlent"),
        past: VerbConjugations(je: "ai parlé", tu: "as parlé", il: "a parlé", nous: "avons parlé", vous: "avez parlé", ils: "ont parlé"),
        future: VerbConjugations(je: "parlerai", tu: "parleras", il: "parlera", nous: "parlerons", vous: "parlerez", ils: "parleront")
    ),
    FrenchVerb(
        infinitive: "faire",
        englishMeaning: "to do/make",
        present: VerbConjugations(je: "fais", tu: "fais", il: "fait", nous: "faisons", vous: "faites", ils: "font"),
        past: VerbConjugations(je: "ai fait", tu: "as fait", il: "a fait", nous: "avons fait", vous: "avez fait", ils: "ont fait"),
        future: VerbConjugations(je: "ferai", tu: "feras", il: "fera", nous: "ferons", vous: "ferez", ils: "feront")
    ),

    // Verbs imported from VerbsExpansionNotes.md (full conjugations)
    FrenchVerb(
        infinitive: "aimer",
        englishMeaning: "to like/love",
        present: VerbConjugations(je: "j'aime", tu: "tu aimes", il: "il/elle/on aime", nous: "nous aimons", vous: "vous aimez", ils: "ils/elles aiment"),
        past: VerbConjugations(je: "j'ai aimé", tu: "tu as aimé", il: "il/elle/on a aimé", nous: "nous avons aimé", vous: "vous avez aimé", ils: "ils/elles ont aimé"),
        future: VerbConjugations(je: "j'aimerai", tu: "tu aimeras", il: "il/elle/on aimera", nous: "nous aimerons", vous: "vous aimerez", ils: "ils/elles aimeront")
    ),
    FrenchVerb(infinitive: "finir", englishMeaning: "to finish", present: VerbConjugations(je: "je finis", tu: "tu finis", il: "il/elle/on finit", nous: "nous finissons", vous: "vous finissez", ils: "ils/elles finissent"), past: VerbConjugations(je: "j'ai fini", tu: "tu as fini", il: "il/elle/on a fini", nous: "nous avons fini", vous: "vous avez fini", ils: "ils/elles ont fini"), future: VerbConjugations(je: "je finirai", tu: "tu finiras", il: "il/elle/on finira", nous: "nous finirons", vous: "vous finirez", ils: "ils/elles finiront")),
    FrenchVerb(infinitive: "vendre", englishMeaning: "to sell", present: VerbConjugations(je: "je vends", tu: "tu vends", il: "il/elle/on vend", nous: "nous vendons", vous: "vous vendez", ils: "ils/elles vendent"), past: VerbConjugations(je: "j'ai vendu", tu: "tu as vendu", il: "il/elle/on a vendu", nous: "nous avons vendu", vous: "vous avez vendu", ils: "ils/elles ont vendu"), future: VerbConjugations(je: "je vendrai", tu: "tu vendras", il: "il/elle/on vendra", nous: "nous vendrons", vous: "vous vendrez", ils: "ils/elles vendront")),
    FrenchVerb(infinitive: "mettre", englishMeaning: "to put", present: VerbConjugations(je: "je mets", tu: "tu mets", il: "il/elle/on met", nous: "nous mettons", vous: "vous mettez", ils: "ils/elles mettent"), past: VerbConjugations(je: "j'ai mis", tu: "tu as mis", il: "il/elle/on a mis", nous: "nous avons mis", vous: "vous avez mis", ils: "ils/elles ont mis"), future: VerbConjugations(je: "je mettrai", tu: "tu mettras", il: "il/elle/on mettra", nous: "nous mettrons", vous: "vous mettrez", ils: "ils/elles mettront")),
    FrenchVerb(infinitive: "sortir", englishMeaning: "to go out", present: VerbConjugations(je: "je sors", tu: "tu sors", il: "il/elle/on sort", nous: "nous sortons", vous: "vous sortez", ils: "ils/elles sortent"), past: VerbConjugations(je: "je suis sorti(e)", tu: "tu es sorti(e)", il: "il/elle/on est sorti(e)", nous: "nous sommes sorti(e)s", vous: "vous êtes sorti(e)(s)", ils: "ils/elles sont sorti(e)s"), future: VerbConjugations(je: "je sortirai", tu: "tu sortiras", il: "il/elle/on sortira", nous: "nous sortirons", vous: "vous sortirez", ils: "ils/elles sortiront")),
    FrenchVerb(infinitive: "partir", englishMeaning: "to leave", present: VerbConjugations(je: "je pars", tu: "tu pars", il: "il/elle/on part", nous: "nous partons", vous: "vous partez", ils: "ils/elles partent"), past: VerbConjugations(je: "je suis parti(e)", tu: "tu es parti(e)", il: "il/elle/on est parti(e)", nous: "nous sommes parti(e)s", vous: "vous êtes parti(e)(s)", ils: "ils/elles sont parti(e)s"), future: VerbConjugations(je: "je partirai", tu: "tu partiras", il: "il/elle/on partira", nous: "nous partirons", vous: "vous partirez", ils: "ils/elles partiront")),
    FrenchVerb(infinitive: "dormir", englishMeaning: "to sleep", present: VerbConjugations(je: "je dors", tu: "tu dors", il: "il/elle/on dort", nous: "nous dormons", vous: "vous dormez", ils: "ils/elles dorment"), past: VerbConjugations(je: "j'ai dormi", tu: "tu as dormi", il: "il/elle/on a dormi", nous: "nous avons dormi", vous: "vous avez dormi", ils: "ils/elles ont dormi"), future: VerbConjugations(je: "je dormirai", tu: "tu dormiras", il: "il/elle/on dormira", nous: "nous dormirons", vous: "vous dormirez", ils: "ils/elles dormiront")),
    FrenchVerb(infinitive: "écrire", englishMeaning: "to write", present: VerbConjugations(je: "j'écris", tu: "tu écris", il: "il/elle/on écrit", nous: "nous écrivons", vous: "vous écrivez", ils: "ils/elles écrivent"), past: VerbConjugations(je: "j'ai écrit", tu: "tu as écrit", il: "il/elle/on a écrit", nous: "nous avons écrit", vous: "vous avez écrit", ils: "ils/elles ont écrit"), future: VerbConjugations(je: "j'écrirai", tu: "tu écriras", il: "il/elle/on écrira", nous: "nous écrirons", vous: "vous écrirez", ils: "ils/elles écriront")),
    FrenchVerb(infinitive: "lire", englishMeaning: "to read", present: VerbConjugations(je: "je lis", tu: "tu lis", il: "il/elle/on lit", nous: "nous lisons", vous: "vous lisez", ils: "ils/elles lisent"), past: VerbConjugations(je: "j'ai lu", tu: "tu as lu", il: "il/elle/on a lu", nous: "nous avons lu", vous: "vous avez lu", ils: "ils/elles ont lu"), future: VerbConjugations(je: "je lirai", tu: "tu liras", il: "il/elle/on lira", nous: "nous lirons", vous: "vous lirez", ils: "ils/elles liront")),
    FrenchVerb(infinitive: "dire", englishMeaning: "to say", present: VerbConjugations(je: "je dis", tu: "tu dis", il: "il/elle/on dit", nous: "nous disons", vous: "vous dites", ils: "ils/elles disent"), past: VerbConjugations(je: "j'ai dit", tu: "tu as dit", il: "il/elle/on a dit", nous: "nous avons dit", vous: "vous avez dit", ils: "ils/elles ont dit"), future: VerbConjugations(je: "je dirai", tu: "tu diras", il: "il/elle/on dira", nous: "nous dirons", vous: "vous direz", ils: "ils/elles diront")),
    FrenchVerb(infinitive: "connaître", englishMeaning: "to know", present: VerbConjugations(je: "je connais", tu: "tu connais", il: "il/elle/on connaît", nous: "nous connaissons", vous: "vous connaissez", ils: "ils/elles connaissent"), past: VerbConjugations(je: "j'ai connu", tu: "tu as connu", il: "il/elle/on a connu", nous: "nous avons connu", vous: "vous avez connu", ils: "ils/elles ont connu"), future: VerbConjugations(je: "je connaîtrai", tu: "tu connaîtras", il: "il/elle/on connaîtra", nous: "nous connaîtrons", vous: "vous connaîtrez", ils: "ils/elles connaîtront")),
    FrenchVerb(infinitive: "croire", englishMeaning: "to believe", present: VerbConjugations(je: "je crois", tu: "tu crois", il: "il/elle/on croit", nous: "nous croyons", vous: "vous croyez", ils: "ils/elles croient"), past: VerbConjugations(je: "j'ai cru", tu: "tu as cru", il: "il/elle/on a cru", nous: "nous avons cru", vous: "vous avez cru", ils: "ils/elles ont cru"), future: VerbConjugations(je: "je croirai", tu: "tu croiras", il: "il/elle/on croira", nous: "nous croirons", vous: "vous croirez", ils: "ils/elles croiront")),
    FrenchVerb(infinitive: "tenir", englishMeaning: "to hold", present: VerbConjugations(je: "je tiens", tu: "tu tiens", il: "il/elle/on tient", nous: "nous tenons", vous: "vous tenez", ils: "ils/elles tiennent"), past: VerbConjugations(je: "j'ai tenu", tu: "tu as tenu", il: "il/elle/on a tenu", nous: "nous avons tenu", vous: "vous avez tenu", ils: "ils/elles ont tenu"), future: VerbConjugations(je: "je tiendrai", tu: "tu tiendras", il: "il/elle/on tiendra", nous: "nous tiendrons", vous: "vous tiendrez", ils: "ils/elles tiendront")),
    FrenchVerb(infinitive: "suivre", englishMeaning: "to follow", present: VerbConjugations(je: "je suis", tu: "tu suis", il: "il/elle/on suit", nous: "nous suivons", vous: "vous suivez", ils: "ils/elles suivent"), past: VerbConjugations(je: "j'ai suivi", tu: "tu as suivi", il: "il/elle/on a suivi", nous: "nous avons suivi", vous: "vous avez suivi", ils: "ils/elles ont suivi"), future: VerbConjugations(je: "je suivrai", tu: "tu suivras", il: "il/elle/on suivra", nous: "nous suivrons", vous: "vous suivrez", ils: "ils/elles suivront")),
    FrenchVerb(infinitive: "ouvrir", englishMeaning: "to open", present: VerbConjugations(je: "j'ouvre", tu: "tu ouvres", il: "il/elle/on ouvre", nous: "nous ouvrons", vous: "vous ouvrez", ils: "ils/elles ouvrent"), past: VerbConjugations(je: "j'ai ouvert", tu: "tu as ouvert", il: "il/elle/on a ouvert", nous: "nous avons ouvert", vous: "vous avez ouvert", ils: "ils/elles ont ouvert"), future: VerbConjugations(je: "j'ouvrirai", tu: "tu ouvriras", il: "il/elle/on ouvrira", nous: "nous ouvrirons", vous: "vous ouvrirez", ils: "ils/elles ouvriront")),
    FrenchVerb(infinitive: "offrir", englishMeaning: "to offer", present: VerbConjugations(je: "j'offre", tu: "tu offres", il: "il/elle/on offre", nous: "nous offrons", vous: "vous offrez", ils: "ils/elles offrent"), past: VerbConjugations(je: "j'ai offert", tu: "tu as offert", il: "il/elle/on a offert", nous: "nous avons offert", vous: "vous avez offert", ils: "ils/elles ont offert"), future: VerbConjugations(je: "j'offrirai", tu: "tu offriras", il: "il/elle/on offrira", nous: "nous offrirons", vous: "vous offrirez", ils: "ils/elles offriront")),
    FrenchVerb(infinitive: "recevoir", englishMeaning: "to receive", present: VerbConjugations(je: "je reçois", tu: "tu reçois", il: "il/elle/on reçoit", nous: "nous recevons", vous: "vous recevez", ils: "ils/elles reçoivent"), past: VerbConjugations(je: "j'ai reçu", tu: "tu as reçu", il: "il/elle/on a reçu", nous: "nous avons reçu", vous: "vous avez reçu", ils: "ils/elles ont reçu"), future: VerbConjugations(je: "je recevrai", tu: "tu recevras", il: "il/elle/on recevra", nous: "nous recevrons", vous: "vous recevrez", ils: "ils/elles recevront")),
    FrenchVerb(infinitive: "apercevoir", englishMeaning: "to glimpse", present: VerbConjugations(je: "j'aperçois", tu: "tu aperçois", il: "il/elle/on aperçoit", nous: "nous apercevons", vous: "vous apercevez", ils: "ils/elles aperçoivent"), past: VerbConjugations(je: "j'ai aperçu", tu: "tu as aperçu", il: "il/elle/on a aperçu", nous: "nous avons aperçu", vous: "vous avez aperçu", ils: "ils/elles ont aperçu"), future: VerbConjugations(je: "j'apercevrai", tu: "tu apercevras", il: "il/elle/on apercevra", nous: "nous apercevrons", vous: "vous apercevrez", ils: "ils/elles apercevront")),
    FrenchVerb(infinitive: "appeler", englishMeaning: "to call", present: VerbConjugations(je: "j'appelle", tu: "tu appelles", il: "il/elle/on appelle", nous: "nous appelons", vous: "vous appelez", ils: "ils/elles appellent"), past: VerbConjugations(je: "j'ai appelé", tu: "tu as appelé", il: "il/elle/on a appelé", nous: "nous avons appelé", vous: "vous avez appelé", ils: "ils/elles ont appelé"), future: VerbConjugations(je: "j'appellerai", tu: "tu appeleras", il: "il/elle/on appellera", nous: "nous appellerons", vous: "vous appellerez", ils: "ils/elles appelleront")),
    FrenchVerb(infinitive: "jeter", englishMeaning: "to throw", present: VerbConjugations(je: "je jette", tu: "tu jettes", il: "il/elle/on jette", nous: "nous jetons", vous: "vous jetez", ils: "ils/elles jettent"), past: VerbConjugations(je: "j'ai jeté", tu: "tu as jeté", il: "il/elle/on a jeté", nous: "nous avons jeté", vous: "vous avez jeté", ils: "ils/elles ont jeté"), future: VerbConjugations(je: "je jetterai", tu: "tu jetteras", il: "il/elle/on jettera", nous: "nous jetterons", vous: "vous jetterez", ils: "ils/elles jetteront")),
    FrenchVerb(infinitive: "payer", englishMeaning: "to pay", present: VerbConjugations(je: "je paie", tu: "tu paies", il: "il/elle/on paie", nous: "nous payons", vous: "vous payez", ils: "ils/elles paient"), past: VerbConjugations(je: "j'ai payé", tu: "tu as payé", il: "il/elle/on a payé", nous: "nous avons payé", vous: "vous avez payé", ils: "ils/elles ont payé"), future: VerbConjugations(je: "je paierai", tu: "tu paieras", il: "il/elle/on paiera", nous: "nous paierons", vous: "vous paierez", ils: "ils/elles paieront")),
    FrenchVerb(infinitive: "acheter", englishMeaning: "to buy", present: VerbConjugations(je: "j'achète", tu: "tu achètes", il: "il/elle/on achète", nous: "nous achetons", vous: "vous achetez", ils: "ils/elles achètent"), past: VerbConjugations(je: "j'ai acheté", tu: "tu as acheté", il: "il/elle/on a acheté", nous: "nous avons acheté", vous: "vous avez acheté", ils: "ils/elles ont acheté"), future: VerbConjugations(je: "j'achèterai", tu: "tu achèteras", il: "il/elle/on achètera", nous: "nous achèterons", vous: "vous achèterez", ils: "ils/elles achèteront")),
    FrenchVerb(infinitive: "préférer", englishMeaning: "to prefer", present: VerbConjugations(je: "je préfère", tu: "tu préfères", il: "il/elle/on préfère", nous: "nous préférons", vous: "vous préférez", ils: "ils/elles préfèrent"), past: VerbConjugations(je: "j'ai préféré", tu: "tu as préféré", il: "il/elle/on a préféré", nous: "nous avons préféré", vous: "vous avez préféré", ils: "ils/elles ont préféré"), future: VerbConjugations(je: "je préférerai", tu: "tu préféreras", il: "il/elle/on préférera", nous: "nous préférerons", vous: "vous préférerez", ils: "ils/elles préféreront")),
    FrenchVerb(infinitive: "espérer", englishMeaning: "to hope", present: VerbConjugations(je: "j'espère", tu: "tu espères", il: "il/elle/on espère", nous: "nous espérons", vous: "vous espérez", ils: "ils/elles espèrent"), past: VerbConjugations(je: "j'ai espéré", tu: "tu as espéré", il: "il/elle/on a espéré", nous: "nous avons espéré", vous: "vous avez espéré", ils: "ils/elles ont espéré"), future: VerbConjugations(je: "j'espérerai", tu: "tu espéreras", il: "il/elle/on espérera", nous: "nous espérerons", vous: "vous espérerez", ils: "ils/elles espéreront")),
    FrenchVerb(infinitive: "nettoyer", englishMeaning: "to clean", present: VerbConjugations(je: "je nettoie", tu: "tu nettoies", il: "il/elle/on nettoie", nous: "nous nettoyons", vous: "vous nettoyez", ils: "ils/elles nettoient"), past: VerbConjugations(je: "j'ai nettoyé", tu: "tu as nettoyé", il: "il/elle/on a nettoyé", nous: "nous avons nettoyé", vous: "vous avez nettoyé", ils: "ils/elles ont nettoyé"), future: VerbConjugations(je: "je nettoierai", tu: "tu nettoieras", il: "il/elle/on nettoiera", nous: "nous nettoierons", vous: "vous nettoierez", ils: "ils/elles nettoieront")),
    FrenchVerb(infinitive: "envoyer", englishMeaning: "to send", present: VerbConjugations(je: "j'envoie", tu: "tu envoies", il: "il/elle/on envoie", nous: "nous envoyons", vous: "vous envoyez", ils: "ils/elles envoient"), past: VerbConjugations(je: "j'ai envoyé", tu: "tu as envoyé", il: "il/elle/on a envoyé", nous: "nous avons envoyé", vous: "vous avez envoyé", ils: "ils/elles ont envoyé"), future: VerbConjugations(je: "j'enverrai", tu: "tu enverras", il: "il/elle/on enverra", nous: "nous enverrons", vous: "vous enverrez", ils: "ils/elles enverront")),
    FrenchVerb(infinitive: "courir", englishMeaning: "to run", present: VerbConjugations(je: "je cours", tu: "tu cours", il: "il/elle/on court", nous: "nous courons", vous: "vous courez", ils: "ils/elles courent"), past: VerbConjugations(je: "j'ai couru", tu: "tu as couru", il: "il/elle/on a couru", nous: "nous avons couru", vous: "vous avez couru", ils: "ils/elles ont couru"), future: VerbConjugations(je: "je courrai", tu: "tu courras", il: "il/elle/on courra", nous: "nous courrons", vous: "vous courrez", ils: "ils/elles courront")),
    FrenchVerb(infinitive: "valoir", englishMeaning: "to be worth", present: VerbConjugations(je: "je vaux", tu: "tu vaux", il: "il/elle/on vaut", nous: "nous valons", vous: "vous valez", ils: "ils/elles valent"), past: VerbConjugations(je: "j'ai valu", tu: "tu as valu", il: "il/elle/on a valu", nous: "nous avons valu", vous: "vous avez valu", ils: "ils/elles ont valu"), future: VerbConjugations(je: "je vaudrai", tu: "tu vaudras", il: "il/elle/on vaudra", nous: "nous vaudrons", vous: "vous vaudrez", ils: "ils/elles vaudront")),
    FrenchVerb(infinitive: "falloir", englishMeaning: "to be necessary", present: VerbConjugations(je: "il faut", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), past: VerbConjugations(je: "il a fallu", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), future: VerbConjugations(je: "il faudra", tu: "—", il: "—", nous: "—", vous: "—", ils: "—")),
    FrenchVerb(infinitive: "pleuvoir", englishMeaning: "to rain", present: VerbConjugations(je: "il pleut", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), past: VerbConjugations(je: "il a plu", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), future: VerbConjugations(je: "il pleuvra", tu: "—", il: "—", nous: "—", vous: "—", ils: "—")),
    FrenchVerb(infinitive: "naître", englishMeaning: "to be born", present: VerbConjugations(je: "je nais", tu: "tu nais", il: "il/elle/on naît", nous: "nous naissons", vous: "vous naissez", ils: "ils/elles naissent"), past: VerbConjugations(je: "je suis né(e)", tu: "tu es né(e)", il: "il/elle/on est né(e)", nous: "nous sommes né(e)s", vous: "vous êtes né(e)(s)", ils: "ils/elles sont né(e)s"), future: VerbConjugations(je: "je naîtrai", tu: "tu naîtras", il: "il/elle/on naîtra", nous: "nous naîtrons", vous: "vous naîtrez", ils: "ils/elles naîtront")),
    FrenchVerb(infinitive: "mourir", englishMeaning: "to die", present: VerbConjugations(je: "je meurs", tu: "tu meurs", il: "il/elle/on meurt", nous: "nous mourons", vous: "vous mourez", ils: "ils/elles meurent"), past: VerbConjugations(je: "je suis mort(e)", tu: "tu es mort(e)", il: "il/elle/on est mort(e)", nous: "nous sommes mort(e)s", vous: "vous êtes mort(e)(s)", ils: "ils/elles sont mort(e)s"), future: VerbConjugations(je: "je mourrai", tu: "tu mourras", il: "il/elle/on mourra", nous: "nous mourrons", vous: "vous mourrez", ils: "ils/elles mourront")),
    FrenchVerb(infinitive: "battre", englishMeaning: "to beat", present: VerbConjugations(je: "je bats", tu: "tu bats", il: "il/elle/on bat", nous: "nous battons", vous: "vous battez", ils: "ils/elles battent"), past: VerbConjugations(je: "j'ai battu", tu: "tu as battu", il: "il/elle/on a battu", nous: "nous avons battu", vous: "vous avez battu", ils: "ils/elles ont battu"), future: VerbConjugations(je: "je battrai", tu: "tu battras", il: "il/elle/on battra", nous: "nous battrons", vous: "vous battrez", ils: "ils/elles battront")),
    FrenchVerb(infinitive: "peindre", englishMeaning: "to paint", present: VerbConjugations(je: "je peins", tu: "tu peins", il: "il/elle/on peint", nous: "nous peignons", vous: "vous peignez", ils: "ils/elles peignent"), past: VerbConjugations(je: "j'ai peint", tu: "tu as peint", il: "il/elle/on a peint", nous: "nous avons peint", vous: "vous avez peint", ils: "ils/elles ont peint"), future: VerbConjugations(je: "je peindrai", tu: "tu peindras", il: "il/elle/on peindra", nous: "nous peindrons", vous: "vous peindrez", ils: "ils/elles peindront")),
    FrenchVerb(infinitive: "craindre", englishMeaning: "to fear", present: VerbConjugations(je: "je crains", tu: "tu crains", il: "il/elle/on craint", nous: "nous craignons", vous: "vous craignez", ils: "ils/elles craignent"), past: VerbConjugations(je: "j'ai craint", tu: "tu as craint", il: "il/elle/on a craint", nous: "nous avons craint", vous: "vous avez craint", ils: "ils/elles ont craint"), future: VerbConjugations(je: "je craindrai", tu: "tu craindras", il: "il/elle/on craindra", nous: "nous craindrons", vous: "vous craindrez", ils: "ils/elles craindront")),
    FrenchVerb(infinitive: "joindre", englishMeaning: "to join", present: VerbConjugations(je: "je joins", tu: "tu joins", il: "il/elle/on joint", nous: "nous joignons", vous: "vous joignez", ils: "ils/elles joignent"), past: VerbConjugations(je: "j'ai joint", tu: "tu as joint", il: "il/elle/on a joint", nous: "nous avons joint", vous: "vous avez joint", ils: "ils/elles ont joint"), future: VerbConjugations(je: "je joindrai", tu: "tu joindras", il: "il/elle/on joindra", nous: "nous joindrons", vous: "vous joindrez", ils: "ils/elles joindront")),
    FrenchVerb(infinitive: "résoudre", englishMeaning: "to solve", present: VerbConjugations(je: "je résous", tu: "tu résous", il: "il/elle/on résout", nous: "nous résolvons", vous: "vous résolvez", ils: "ils/elles résolvent"), past: VerbConjugations(je: "j'ai résolu", tu: "tu as résolu", il: "il/elle/on a résolu", nous: "nous avons résolu", vous: "vous avez résolu", ils: "ils/elles ont résolu"), future: VerbConjugations(je: "je résoudrai", tu: "tu résoudras", il: "il/elle/on résoudra", nous: "nous résoudrons", vous: "vous résoudrez", ils: "ils/elles résoudront")),
    FrenchVerb(infinitive: "suffire", englishMeaning: "to suffice", present: VerbConjugations(je: "il suffit", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), past: VerbConjugations(je: "il a suffi", tu: "—", il: "—", nous: "—", vous: "—", ils: "—"), future: VerbConjugations(je: "il suffira", tu: "—", il: "—", nous: "—", vous: "—", ils: "—")),
    FrenchVerb(infinitive: "apparaître", englishMeaning: "to appear", present: VerbConjugations(je: "j'apparais", tu: "tu apparais", il: "il/elle/on apparaît", nous: "nous apparaissons", vous: "vous apparaissez", ils: "ils/elles apparaissent"), past: VerbConjugations(je: "j'ai apparu", tu: "tu as apparu", il: "il/elle/on a apparu", nous: "nous avons apparu", vous: "vous avez apparu", ils: "ils/elles ont apparu"), future: VerbConjugations(je: "j'apparaîtrai", tu: "tu apparaîtras", il: "il/elle/on apparaîtra", nous: "nous apparaîtrons", vous: "vous apparaîtrez", ils: "ils/elles apparaîtront")),
    FrenchVerb(infinitive: "disparaître", englishMeaning: "to disappear", present: VerbConjugations(je: "je disparais", tu: "tu disparais", il: "il/elle/on disparaît", nous: "nous disparaissons", vous: "vous disparaissez", ils: "ils/elles disparaissent"), past: VerbConjugations(je: "j'ai disparu", tu: "tu as disparu", il: "il/elle/on a disparu", nous: "nous avons disparu", vous: "vous avez disparu", ils: "ils/elles ont disparu"), future: VerbConjugations(je: "je disparaîtrai", tu: "tu disparaîtras", il: "il/elle/on disparaîtra", nous: "nous disparaîtrons", vous: "vous disparaîtrez", ils: "ils/elles disparaîtront")),
    FrenchVerb(infinitive: "s’asseoir", englishMeaning: "to sit", present: VerbConjugations(je: "je m'assois", tu: "tu t'assois", il: "il/elle/on s'assoit", nous: "nous nous assoyons", vous: "vous vous assoyez", ils: "ils/elles s'assoient"), past: VerbConjugations(je: "je me suis assis(e)", tu: "tu t'es assis(e)", il: "il/elle/on s'est assis(e)", nous: "nous nous sommes assis(e)s", vous: "vous vous êtes assis(e)(s)", ils: "ils/elles se sont assis(e)s"), future: VerbConjugations(je: "je m'assoirai", tu: "tu t'assoiras", il: "il/elle/on s'assoira", nous: "nous nous assoirons", vous: "vous vous assoirez", ils: "ils/elles s'assoiront")),
    FrenchVerb(infinitive: "rire", englishMeaning: "to laugh", present: VerbConjugations(je: "je ris", tu: "tu ris", il: "il/elle/on rit", nous: "nous rions", vous: "vous riez", ils: "ils/elles rient"), past: VerbConjugations(je: "j'ai ri", tu: "tu as ri", il: "il/elle/on a ri", nous: "nous avons ri", vous: "vous avez ri", ils: "ils/elles ont ri"), future: VerbConjugations(je: "je rirai", tu: "tu riras", il: "il/elle/on rira", nous: "nous rirons", vous: "vous rirez", ils: "ils/elles riront")),
    FrenchVerb(infinitive: "sourire", englishMeaning: "to smile", present: VerbConjugations(je: "je souris", tu: "tu souris", il: "il/elle/on sourit", nous: "nous sourions", vous: "vous souriez", ils: "ils/elles sourient"), past: VerbConjugations(je: "j'ai souri", tu: "tu as souri", il: "il/elle/on a souri", nous: "nous avons souri", vous: "vous avez souri", ils: "ils/elles ont souri"), future: VerbConjugations(je: "je sourirai", tu: "tu souriras", il: "il/elle/on sourira", nous: "nous sourirons", vous: "vous sourirez", ils: "ils/elles souriront")),
    FrenchVerb(infinitive: "cuire", englishMeaning: "to cook", present: VerbConjugations(je: "je cuis", tu: "tu cuis", il: "il/elle/on cuit", nous: "nous cuisons", vous: "vous cuisez", ils: "ils/elles cuisent"), past: VerbConjugations(je: "j'ai cuit", tu: "tu as cuit", il: "il/elle/on a cuit", nous: "nous avons cuit", vous: "vous avez cuit", ils: "ils/elles ont cuit"), future: VerbConjugations(je: "je cuirai", tu: "tu cuiras", il: "il/elle/on cuira", nous: "nous cuirons", vous: "vous cuirez", ils: "ils/elles cuiront")),
    FrenchVerb(infinitive: "bouillir", englishMeaning: "to boil", present: VerbConjugations(je: "je bous", tu: "tu bous", il: "il/elle/on bout", nous: "nous bouillons", vous: "vous bouillez", ils: "ils/elles bouillent"), past: VerbConjugations(je: "j'ai bouilli", tu: "tu as bouilli", il: "il/elle/on a bouilli", nous: "nous avons bouilli", vous: "vous avez bouilli", ils: "ils/elles ont bouilli"), future: VerbConjugations(je: "je bouillirai", tu: "tu bouilliras", il: "il/elle/on bouillira", nous: "nous bouillirons", vous: "vous bouillirez", ils: "ils/elles bouilliront")),
    FrenchVerb(infinitive: "vaincre", englishMeaning: "to defeat", present: VerbConjugations(je: "je vaincs", tu: "tu vaincs", il: "il/elle/on vainc", nous: "nous vainquons", vous: "vous vainquez", ils: "ils/elles vainquent"), past: VerbConjugations(je: "j'ai vaincu", tu: "tu as vaincu", il: "il/elle/on a vaincu", nous: "nous avons vaincu", vous: "vous avez vaincu", ils: "ils/elles ont vaincu"), future: VerbConjugations(je: "je vaincrai", tu: "tu vaincras", il: "il/elle/on vaincra", nous: "nous vaincrons", vous: "vous vaincrez", ils: "ils/elles vaincront")),
    FrenchVerb(infinitive: "convaincre", englishMeaning: "to convince", present: VerbConjugations(je: "je convaincs", tu: "tu convaincs", il: "il/elle/on convainc", nous: "nous convainquons", vous: "vous convainquez", ils: "ils/elles convainquent"), past: VerbConjugations(je: "j'ai convaincu", tu: "tu as convaincu", il: "il/elle/on a convaincu", nous: "nous avons convaincu", vous: "vous avez convaincu", ils: "ils/elles ont convaincu"), future: VerbConjugations(je: "je convaincrai", tu: "tu convaincras", il: "il/elle/on convaincra", nous: "nous convaincrons", vous: "vous convaincrez", ils: "ils/elles convaincront")),
    FrenchVerb(infinitive: "atteindre", englishMeaning: "to reach", present: VerbConjugations(je: "j'atteins", tu: "tu atteins", il: "il/elle/on atteint", nous: "nous atteignons", vous: "vous atteignez", ils: "ils/elles atteignent"), past: VerbConjugations(je: "j'ai atteint", tu: "tu as atteint", il: "il/elle/on a atteint", nous: "nous avons atteint", vous: "vous avez atteint", ils: "ils/elles ont atteint"), future: VerbConjugations(je: "j'atteindrai", tu: "tu atteindras", il: "il/elle/on atteindra", nous: "nous atteindrons", vous: "vous atteindrez", ils: "ils/elles atteindront")),
    FrenchVerb(infinitive: "éteindre", englishMeaning: "to turn off", present: VerbConjugations(je: "j'éteins", tu: "tu éteins", il: "il/elle/on éteint", nous: "nous éteignons", vous: "vous éteignez", ils: "ils/elles éteignent"), past: VerbConjugations(je: "j'ai éteint", tu: "tu as éteint", il: "il/elle/on a éteint", nous: "nous avons éteint", vous: "vous avez éteint", ils: "ils/elles ont éteint"), future: VerbConjugations(je: "j'éteindrai", tu: "tu éteindras", il: "il/elle/on éteindra", nous: "nous éteindrons", vous: "vous éteindrez", ils: "ils/elles éteindront")),
    FrenchVerb(infinitive: "plaindre", englishMeaning: "to pity", present: VerbConjugations(je: "je plains", tu: "tu plains", il: "il/elle/on plaint", nous: "nous plaignons", vous: "vous plaignez", ils: "ils/elles plaignent"), past: VerbConjugations(je: "j'ai plaint", tu: "tu as plaint", il: "il/elle/on a plaint", nous: "nous avons plaint", vous: "vous avez plaint", ils: "ils/elles ont plaint"), future: VerbConjugations(je: "je plaindrai", tu: "tu plaindras", il: "il/elle/on plaindra", nous: "nous plaindrons", vous: "vous plaindrez", ils: "ils/elles plaindront"))
]

enum Tense: String, CaseIterable { case present = "Present", past = "Past", future = "Future" }

extension FrenchVerb {
    func conjugation(for pronoun: Pronoun, tense: Tense) -> String {
        let set: VerbConjugations
        switch tense {
        case .present: set = present
        case .past: set = past
        case .future: set = future
        }
        switch pronoun {
        case .je: return set.je
        case .tu: return set.tu
        case .il: return set.il
        case .nous: return set.nous
        case .vous: return set.vous
        case .ils: return set.ils
        }
    }
}

