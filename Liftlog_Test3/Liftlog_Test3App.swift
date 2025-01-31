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
