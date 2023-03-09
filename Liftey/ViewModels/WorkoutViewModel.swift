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
    
    init(workout: Workout, isPresented: Bool) {
        self.workout = workout
        self.isPresented = isPresented
    }
}
