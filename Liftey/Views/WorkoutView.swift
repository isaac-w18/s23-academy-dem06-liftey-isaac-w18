//
//  WorkoutView.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject var viewModel: WorkoutViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section("Exercises") {
                    ForEach(viewModel.workout.exercises) { exercise in
                        ExerciseRowItemView(exercise: exercise)
                    }
                }
                .navigationTitle("My Workout")
            }
            .toolbar() {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            viewModel.isPresented.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text(" New Exercise")
                            }
                        }
                        .sheet(isPresented: $viewModel.isPresented) {
                            CreateExerciseView(viewModel: viewModel)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(viewModel: WorkoutViewModel(workout: Workout.example, isPresented: false))
    }
}
