//
//  ContentView.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WorkoutView(viewModel: WorkoutViewModel(workout: Workout.example, isPresented: false))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
