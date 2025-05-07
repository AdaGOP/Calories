//
//  Sport.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import Foundation

// TODO: Step 2 - Convert to class
struct Sport: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let duration = 3
    let caloriesBurned: Int

    // TODO: Step 1 - Change the value and see the result
    static let topExercises = [
        Sport(name: "Badminton", caloriesBurned: 500),
        Sport(name: "Soccer", caloriesBurned: 550),
        Sport(name: "Tennis", caloriesBurned: 600),
        Sport(name: "Archery", caloriesBurned: 300),
        Sport(name: "Volleyball", caloriesBurned: 450),
        Sport(name: "Chess", caloriesBurned: 50),
        Sport(name: "Basketball", caloriesBurned: 505),
        Sport(name: "Swimming", caloriesBurned: 350),
        Sport(name: "Running", caloriesBurned: 500),
    ]
}
