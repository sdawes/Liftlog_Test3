//
//  WorkoutSet.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import SwiftData
import Foundation

@Model
final class WorkoutSet {
    var reps: Int
    var weight: Double // Weight in kg to 2 decimal places
    var dateAdded: Date // New property to track when the set was created
    var exercise: Exercise?

    init(reps: Int, weight: Double, exercise: Exercise? = nil) {
        self.reps = reps
        self.weight = weight
        self.dateAdded = Date() // Set to the current date and time
        self.exercise = exercise
    }
}
//
//  Exercise.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    var name: String
    var exerciseCategory: String // New property for exercise category
    var exerciseNotes: String // New property for exercise notes
    var dateAdded: Date // New property to track when the exercise was created
    var lastUpdated: Date // New property to track when the exercise was last updated
    var personalBest: Double? // New property to track the PB (highest weight)
    
    @Relationship(deleteRule: .cascade) var sets: [WorkoutSet]

    init(name: String, exerciseCategory: String = "", exerciseNotes: String = "", sets: [WorkoutSet] = []) {
        self.name = name
        self.exerciseCategory = exerciseCategory
        self.exerciseNotes = exerciseNotes
        self.dateAdded = Date() // Set to the current date and time
        self.lastUpdated = Date() // Set to the current date and time
        self.personalBest = nil // Initially, there is no PB
        self.sets = sets
    }
    
    func updatePersonalBest() {
        guard let latestSet = sets.max(by: { $0.weight < $1.weight }) else { return }
        self.personalBest = latestSet.weight
        self.lastUpdated = Date()
    }
}



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
        Text("Liftlog Test 3")
            .padding()        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Exercise.self, WorkoutSet.self])
}
//
//  Liftlog_Test3App.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import SwiftUI
import SwiftData
import Foundation

@main
struct Liftlog_Test3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Exercise.self, WorkoutSet.self], inMemory: true)
    }
}
