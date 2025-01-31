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



