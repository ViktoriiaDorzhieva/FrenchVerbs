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
    }
}

#Preview {
    ContentView()
}
