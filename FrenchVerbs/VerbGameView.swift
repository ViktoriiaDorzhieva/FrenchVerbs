//
//  VerbGameView.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import SwiftUI

struct VerbGameView: View {
    @State private var viewModel = VerbGameViewModel()
    @State private var isShowingCheatSheet = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.92, blue: 0.88),
                    Color(red: 0.98, green: 0.96, blue: 0.93)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                // Score Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Score")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("\(viewModel.score)/\(viewModel.totalQuestions)")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Accuracy")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("\(viewModel.accuracyPercentage)%")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)

                Spacer()

                // Question Card
                if let verb = viewModel.currentVerb, let pronoun = viewModel.currentPronoun {
                    VStack(spacing: 20) {
                        // Verb Display
                        VStack(spacing: 8) {
                            Text("Conjugate (\(viewModel.currentTense.rawValue)):")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(verb.infinitive)
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.blue)
                            Text(verb.englishMeaning)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .italic()
                        }

                        Divider()

                        // Pronoun Display
                        VStack(spacing: 8) {
                            Text("For the pronoun:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(pronoun.rawValue)
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(.teal)
                        }

                        Divider()

                        // Input Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Enter the conjugation:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            TextField("Type here...", text: $viewModel.userInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.system(size: 18, weight: .semibold))
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .onSubmit {
                                    if !viewModel.userInput.isEmpty {
                                        viewModel.checkAnswer()
                                    }
                                }
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.05), radius: 8)
                }

                Spacer()

                // Feedback Section
                if viewModel.isShowingFeedback {
                    VStack(spacing: 12) {
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: viewModel.isCorrect ?? false ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(viewModel.isCorrect ?? false ? .green : .red)
                                .padding(.top, 2)

                            Text(viewModel.feedback)
                                .font(.body)
                                .foregroundColor(.black)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding()
                    .background(
                        Color(viewModel.isCorrect ?? false ? .green : .red)
                            .opacity(0.1)
                    )
                    .cornerRadius(12)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                // Action Buttons
                HStack(spacing: 12) {
                    if !viewModel.isShowingFeedback {
                        Button(action: {
                            if !viewModel.userInput.isEmpty {
                                viewModel.checkAnswer()
                            }
                        }) {
                            Text("Check Answer")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(viewModel.userInput.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(viewModel.userInput.isEmpty)

                        Button(action: {
                            viewModel.loadNewQuestion()
                        }) {
                            Text("Skip")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    } else {
                        Button(action: {
                            viewModel.nextQuestion()
                        }) {
                            Text("Next Question")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.teal)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }

                Spacer()
                    .frame(height: 8)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { isShowingCheatSheet = true }) {
                    Image(systemName: "line.3.horizontal")
                }
                .accessibilityLabel("Open Cheat Sheet")
            }
        }
        .sheet(isPresented: $isShowingCheatSheet) {
            if let verb = viewModel.currentVerb {
                CheatSheetView(verb: verb)
            } else {
                Text("No verb loaded")
                    .padding()
            }
        }
    }
}

struct CheatSheetView: View {
    let verb: FrenchVerb

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Infinitive")) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(verb.infinitive).font(.title2).fontWeight(.bold)
                        Text(verb.englishMeaning).font(.subheadline).foregroundColor(.gray)
                    }
                }
                Section(header: Text("Present")) {
                    ForEach(verb.present.allPairs, id: \.0) { pronoun, form in
                        HStack { Text(pronoun).fontWeight(.semibold); Spacer(); Text(form) }
                    }
                }
                Section(header: Text("Past (Passé composé)")) {
                    ForEach(verb.past.allPairs, id: \.0) { pronoun, form in
                        HStack { Text(pronoun).fontWeight(.semibold); Spacer(); Text(form) }
                    }
                }
                Section(header: Text("Future (Futur simple)")) {
                    ForEach(verb.future.allPairs, id: \.0) { pronoun, form in
                        HStack { Text(pronoun).fontWeight(.semibold); Spacer(); Text(form) }
                    }
                }
            }
            .navigationTitle("Cheat Sheet")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    VerbGameView()
}
