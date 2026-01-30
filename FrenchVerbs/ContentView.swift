//
//  ContentView.swift
//  FrenchVerbs
//
//  Created by Viktoriia Dorzhieva on 10/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VerbGameView()
                .navigationTitle("French Verbs")
                .navigationBarTitleDisplayMode(.inline)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            #if canImport(UIKit)
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            #endif
        }
    }
}

#Preview {
    ContentView()
}
