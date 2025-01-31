//
//  ContentView.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        Text("Liftlog Test 3")
            .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Exercise.self, WorkoutSet.self])
}
