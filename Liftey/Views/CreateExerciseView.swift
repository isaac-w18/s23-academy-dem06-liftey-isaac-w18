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
    
    
    var body: some View {
        Form {
            Section("Exercise Name") {
                TextField("Create an exercise!", text: $viewModel.name)
            }
            
            Section("Details") {
                Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                HStack {
                    Text("Weight: ")
                        .bold()
                    TextField("", text: $viewModel.weight)
                        .fixedSize()
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(viewModel.weight)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                viewModel.weight = filtered
                            }
                        }
                    Text("lbs")
                }
                
            }
            
            Section {
                Button {
                    viewModel.workout.exercises.append(Exercise(name: viewModel.name, reps: viewModel.reps, sets: viewModel.sets, weight: Int(viewModel.weight) ?? 0))
                    dismiss()
                } label: {
                    Text("Create Exercise")
                }
                .disabled(!viewModel.isValid)
            }
        }
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(viewModel: WorkoutViewModel(workout: Workout.example, isPresented: true))
    }
}
