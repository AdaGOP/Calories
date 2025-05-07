//
//  Contact.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import SwiftUI

@Observable
class Contact {
    var name: String
    var weight: Double

    static let me = Contact(name: "Taylor", weight: 60)

    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }

    func performActivity(caloriesBurned: Int) -> Double {
        let activityWeight = Double(caloriesBurned) / 500
        weight -= activityWeight

        return activityWeight
    }
}
