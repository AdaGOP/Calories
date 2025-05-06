//
//  ExerciseView.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import SwiftUI

struct ExerciseView: View {
    @State private var path: [Sport] = []

    var body: some View {
        NavigationStack(path: $path) {
            List(Sport.topExercises) {
                sport in
                NavigationLink(value: sport) {
                    VStack(alignment: .leading) {
                        Text(sport.name)
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 1)
                        Text("\(sport.caloriesBurned) calories")
                    }
                }
                .padding(4)
            }
            .navigationDestination(for: Sport.self) {
                sport in
                SportView(sport: sport)
            }
            .navigationTitle("Exercise")
        }
    }
}

#Preview {
    ExerciseView()
}
