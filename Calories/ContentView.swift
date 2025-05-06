//
//  ContentView.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Exercise", systemImage: "dumbbell") {
                ExerciseView()
            }
            Tab("Profile", systemImage: "person.crop.circle") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
