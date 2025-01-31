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
