//
//  AddExerciseView.swift
//  Liftlog_Test3
//
//  Created by Stephen Dawes on 31/01/2025.
//

import SwiftData
import SwiftUI

struct AddExerciseView: View {
    @Environment(\.dismiss) private var dismiss // To dismiss the sheet
    
    var body: some View {
        NavigationStack {
            Text("Add Exercise View")
                .navigationTitle("Add Exercise")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill") // Dismiss button
                        }
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            // Save action will go here
                            dismiss() // Dismiss the sheet after saving
                        }
                    }
                }
        }
    }
}

#Preview {
    AddExerciseView()
}
