//
//  CreateExerciseView.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import SwiftUI
import Combine

struct CreateExerciseView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var name = ""
    @State var reps = 8
    @State var sets = 3
    @State var weight = "0"
    
    
    var body: some View {
        Form {
            Section("Exercise Name") {
                TextField("Create an exercise!", text: $name)
            }
            
            Section("Details") {
                Stepper("Reps: \(reps)", value: $reps)
                Stepper("Sets: \(sets)", value: $sets)
                HStack {
                    Text("Weight: ")
                        .bold()
                    TextField("", text: $weight)
                        .fixedSize()
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(weight)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                weight = filtered
                            }
                        }
                    Text("lbs")
                }
            }
            
            Section {
                Button {
                    viewModel.workout.exercises.append(Exercise(name: name, reps: reps, sets: sets, weight: Int(weight) ?? 0))
                } label: {
                    Text("Create Exercise")
                }
            }
        }
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(viewModel: WorkoutViewModel(workout: Workout.example, isPresented: true))
    }
}
