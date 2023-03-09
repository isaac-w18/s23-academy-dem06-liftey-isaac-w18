//
//  WorkoutViewModel.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workout: Workout
    @Published var isPresented: Bool
    @Published var name = ""
    @Published var reps = 8
    @Published var sets = 3
    @Published var weight = "0"
    
    var isValid: Bool {
        !name.isEmpty && reps > 0 && sets > 0 && (Int(weight) ?? 0) >= 0
    }
    
    init(workout: Workout, isPresented: Bool) {
        self.workout = workout
        self.isPresented = isPresented
    }
}
