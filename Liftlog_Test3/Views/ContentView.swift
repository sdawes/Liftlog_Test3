//
//  ContentView.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]

    var body: some View {
        NavigationStack {
            List {
                ForEach(exercises) { exercise in
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                        Text(exercise.category)
                        Text(exercise.notes)
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }

    func addSamples() {
        let exercise1 = Exercise(name: "Bench Press", category: "Push", notes: "Chest exercise")
        let exercise2 = Exercise(name: "Squat", category: "Legs", notes: "Quadriceps exercise")
        let exercise3 = Exercise(name: "Deadlift", category: "Pull", notes: "Back exercise")

        modelContext.insert(exercise1)
        modelContext.insert(exercise2)
        modelContext.insert(exercise3)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Exercise.self, WorkoutSet.self])
}
