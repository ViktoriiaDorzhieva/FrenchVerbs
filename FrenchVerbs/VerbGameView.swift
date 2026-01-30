//
//  VerbGameView.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import SwiftUI

struct VerbGameView: View {
    // MARK: - Properties
    
    @State private var viewModel = VerbGameViewModel()
    @State private var isShowingCheatSheet = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 24) {
                scoreHeader
                
                Spacer()
                
                questionCard
                
                Spacer()
                
                if viewModel.isShowingFeedback {
                    feedbackSection
                }
                
                actionButtons
                
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
    
    // MARK: - View Components
    
    private var backgroundGradient: some View {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
    }
    
    private var scoreHeader: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Score")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(viewModel.score)/\(viewModel.totalQuestions)")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Accuracy")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(viewModel.accuracyPercentage)%")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private var questionCard: some View {
        if let verb = viewModel.currentVerb, let pronoun = viewModel.currentPronoun {
            VStack(spacing: 20) {
                verbDisplay(verb)
                Divider()
                pronounDisplay(pronoun)
                Divider()
                inputField
            }
            .padding(24)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 8)
        }
    }
    
    private func verbDisplay(_ verb: FrenchVerb) -> some View {
        VStack(spacing: 8) {
            Text("Conjugate (\(viewModel.currentTense.rawValue)):")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(verb.infinitive)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.blue)
            Text(verb.englishMeaning)
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
    }
    
    private func pronounDisplay(_ pronoun: Pronoun) -> some View {
        VStack(spacing: 8) {
            Text("For the pronoun:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(pronoun.rawValue)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.teal)
        }
    }
    
    private var inputField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Enter the conjugation:")
                .font(.caption)
                .foregroundColor(.secondary)
            TextField("Type here...", text: $viewModel.userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 18, weight: .semibold))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .foregroundColor(.primary)
                .padding(.vertical, 6)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .onSubmit {
                    if !viewModel.userInput.isEmpty {
                        viewModel.checkAnswer()
                    }
                }
        }
    }
    
    private var feedbackSection: some View {
        VStack(spacing: 12) {
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: viewModel.isCorrect ?? false ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(viewModel.isCorrect ?? false ? .green : .red)
                    .padding(.top, 2)
                
                Text(viewModel.feedback)
                    .font(.body)
                    .foregroundColor(.primary)
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
    
    private var actionButtons: some View {
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
    }
}

// MARK: - Cheat Sheet View

struct CheatSheetView: View {
    let verb: FrenchVerb
    
    var body: some View {
        NavigationStack {
            List {
                infinitiveSection
                conjugationSection(title: "Present", conjugations: verb.present)
                conjugationSection(title: "Past (Passé composé)", conjugations: verb.past)
                conjugationSection(title: "Future (Futur simple)", conjugations: verb.future)
            }
            .navigationTitle("Cheat Sheet")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var infinitiveSection: some View {
        Section(header: Text("Infinitive")) {
            VStack(alignment: .leading, spacing: 4) {
                Text(verb.infinitive)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(verb.englishMeaning)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func conjugationSection(title: String, conjugations: VerbConjugations) -> some View {
        Section(header: Text(title)) {
            ForEach(conjugations.allPairs, id: \.0) { pronoun, form in
                HStack {
                    Text(pronoun)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(form)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    VerbGameView()
}
