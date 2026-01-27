//
//  VerbModel.swift
//  FrenchVerbs
//
//  Created by User on 2024-04-27.
//

import Foundation

struct FrenchVerb {
    let infinitive: String
    let present: String
    let past: String
    let future: String
}

let verbs: [FrenchVerb] = [
    FrenchVerb(infinitive: "aimer", present: "j'aime", past: "j'ai aimé", future: "j'aimerai"),
    FrenchVerb(infinitive: "finir", present: "je finis", past: "j'ai fini", future: "je finirai"),
    FrenchVerb(infinitive: "vendre", present: "je vends", past: "j'ai vendu", future: "je vendrai"),
    FrenchVerb(infinitive: "mettre", present: "je mets", past: "j'ai mis", future: "je mettrai"),
    FrenchVerb(infinitive: "sortir", present: "je sors", past: "je suis sorti(e)", future: "je sortirai"),
    FrenchVerb(infinitive: "partir", present: "je pars", past: "je suis parti(e)", future: "je partirai"),
    FrenchVerb(infinitive: "dormir", present: "je dors", past: "j'ai dormi", future: "je dormirai"),
    FrenchVerb(infinitive: "écrire", present: "j'écris", past: "j'ai écrit", future: "j'écrirai"),
    FrenchVerb(infinitive: "lire", present: "je lis", past: "j'ai lu", future: "je lirai"),
    FrenchVerb(infinitive: "dire", present: "je dis", past: "j'ai dit", future: "je dirai"),
    FrenchVerb(infinitive: "connaître", present: "je connais", past: "j'ai connu", future: "je connaîtrai"),
    FrenchVerb(infinitive: "croire", present: "je crois", past: "j'ai cru", future: "je croirai"),
    FrenchVerb(infinitive: "tenir", present: "je tiens", past: "j'ai tenu", future: "je tiendrai"),
    FrenchVerb(infinitive: "suivre", present: "je suis", past: "j'ai suivi", future: "je suivrai"),
    FrenchVerb(infinitive: "ouvrir", present: "j'ouvre", past: "j'ai ouvert", future: "j'ouvrirai"),
    FrenchVerb(infinitive: "offrir", present: "j'offre", past: "j'ai offert", future: "j'offrirai"),
    FrenchVerb(infinitive: "recevoir", present: "je reçois", past: "j'ai reçu", future: "je recevrai"),
    FrenchVerb(infinitive: "apercevoir", present: "j'aperçois", past: "j'ai aperçu", future: "j'apercevrai"),
    FrenchVerb(infinitive: "appeler", present: "j'appelle", past: "j'ai appelé", future: "j'appellerai"),
    FrenchVerb(infinitive: "jeter", present: "je jette", past: "j'ai jeté", future: "je jetterai"),
    FrenchVerb(infinitive: "payer", present: "je paie", past: "j'ai payé", future: "je paierai"),
    FrenchVerb(infinitive: "acheter", present: "j'achète", past: "j'ai acheté", future: "j'achèterai"),
    FrenchVerb(infinitive: "préférer", present: "je préfère", past: "j'ai préféré", future: "je préfèrerai"),
    FrenchVerb(infinitive: "espérer", present: "j'espère", past: "j'ai espéré", future: "j'espérerai"),
    FrenchVerb(infinitive: "nettoyer", present: "je nettoie", past: "j'ai nettoyé", future: "je nettoierai"),
    FrenchVerb(infinitive: "envoyer", present: "j'envoie", past: "j'ai envoyé", future: "j'enverrai"),
    FrenchVerb(infinitive: "courir", present: "je cours", past: "j'ai couru", future: "je courrai"),
    FrenchVerb(infinitive: "valoir", present: "je vaux", past: "j'ai valu", future: "je vaudrai"),
    FrenchVerb(infinitive: "falloir", present: "il faut", past: "il a fallu", future: "il faudra"),
    FrenchVerb(infinitive: "pleuvoir", present: "il pleut", past: "il a plu", future: "il pleuvra"),
    FrenchVerb(infinitive: "naître", present: "je nais", past: "je suis né(e)", future: "je naîtrai"),
    FrenchVerb(infinitive: "mourir", present: "je meurs", past: "je suis mort(e)", future: "je mourrai"),
    FrenchVerb(infinitive: "battre", present: "je bats", past: "j'ai battu", future: "je battrai"),
    FrenchVerb(infinitive: "peindre", present: "je peins", past: "j'ai peint", future: "je peindrai"),
    FrenchVerb(infinitive: "craindre", present: "je crains", past: "j'ai craint", future: "je craindrai"),
    FrenchVerb(infinitive: "joindre", present: "je joins", past: "j'ai joint", future: "je joindrai"),
    FrenchVerb(infinitive: "résoudre", present: "je résous", past: "j'ai résolu", future: "je résoudrai"),
    FrenchVerb(infinitive: "suffire", present: "il suffit", past: "il a suffi", future: "il suffira"),
    FrenchVerb(infinitive: "apparaître", present: "j'apparais", past: "j'ai apparu", future: "j'apparaîtrai"),
    FrenchVerb(infinitive: "disparaître", present: "je disparais", past: "j'ai disparu", future: "je disparaîtrai"),
    FrenchVerb(infinitive: "s’asseoir", present: "je m'assois", past: "je me suis assis(e)", future: "je m'assoirai"),
    FrenchVerb(infinitive: "rire", present: "je ris", past: "j'ai ri", future: "je rirai"),
    FrenchVerb(infinitive: "sourire", present: "je souris", past: "j'ai souri", future: "je sourirai"),
    FrenchVerb(infinitive: "cuire", present: "je cuis", past: "j'ai cuit", future: "je cuirai"),
    FrenchVerb(infinitive: "bouillir", present: "je bous", past: "j'ai bouilli", future: "je bouillirai"),
    FrenchVerb(infinitive: "vaincre", present: "je vaincs", past: "j'ai vaincu", future: "je vaincrai"),
    FrenchVerb(infinitive: "convaincre", present: "je convaincs", past: "j'ai convaincu", future: "je convaincrai"),
    FrenchVerb(infinitive: "atteindre", present: "j'atteins", past: "j'ai atteint", future: "j'atteindrai"),
    FrenchVerb(infinitive: "éteindre", present: "j'éteins", past: "j'ai éteint", future: "j'éteindrai"),
    FrenchVerb(infinitive: "plaindre", present: "je plains", past: "j'ai plaint", future: "je plaindrai"),
]
