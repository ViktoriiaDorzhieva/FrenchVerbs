# French Verb Conjugations App
French Conjugation is an iOS application I created to practice iOS development, write automated test cases, and improve my French language skills at the same time. The app presents users with random French verbs and challenges them to conjugate them in the correct tense, reinforcing grammar knowledge through active, hands-on practice.

The app also includes a built-in cheat sheet that allows users to quickly review the correct conjugation when needed. A scoring system tracks correct and incorrect answers, helping users monitor their progress and stay motivated over time.<br/>


https://github.com/user-attachments/assets/4e5292c0-0c65-4e92-9dd9-2444105bb731


## Project Description
This project is a native iOS application built with Swift and SwiftUI in Xcode. It uses a simple, user-focused architecture to manage game logic, input validation, and score/accuracy tracking.<br/>

Key technical features include:<br/>
• Random verb, pronoun, and tense generation<br/>
• Conjugation validation that accepts answers with or without the pronoun (e.g., “je suis” or “suis”)<br/>
• Real-time score and accuracy tracking with per-question feedback<br/>
• Cheat Sheet view that displays full conjugations (Present, Past, Future) for the current verb<br/>
• State management for the current verb, pronoun, tense, user input, feedback, and progress via an observable view model<br/>
• SwiftUI UI components for input, feedback, navigation, and a polished game layout<br/>

Data is sourced from a bundled Conjugations.json file and decoded into typed models (FrenchVerb, VerbConjugations). The project is version-controlled with Git and hosted on GitHub, using standard workflows (staging, committing, pushing) managed through Terminal.<br/>

## Environment
• Platform: iOS<br/>
• Minimum iOS version: 17 (recommended)<br/>
• Xcode: 15+ (developed with Xcode 15/16/26-compatible project settings)<br/>
• Swift: 5.9+ (Swift 6 compatible)<br/>
• UI Framework: SwiftUI<br/>
• Dependencies: Foundation (JSON decoding). No third‑party packages.<br/>

Build and Run<br/>
• Open the project in Xcode.<br/>
• Select an iOS Simulator (iPhone 15 or later recommended) or a connected device.<br/>
• Build and run (Cmd+R).<br/>
