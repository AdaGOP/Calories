//
//  SportView.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import SwiftUI

struct SportView: View {
    @Environment(\.dismiss) var dismiss

    let sport: Sport
    let user: Contact = .me
    @State var secondsElapsed: Int = 0
    @State var isStarted = false
    @State var weightDecreased: Double = 0

    var completion: Double {
        let percentage = Double(secondsElapsed)/Double(sport.duration)
        return percentage >= 1 ? 1 : percentage
    }

    var body: some View {
        VStack(spacing: 8) {
            if isStarted {
                VStack {
                    Text("Performing")
                        .font(.title3)

                    Text("\(sport.name)")
                        .font(.largeTitle)
                }
                .padding(30)

                ProgressView(value: completion)
                    .padding(.horizontal, 100)
            }
            else {
                Text("\(sport.name)")
                    .font(.largeTitle)
                    .bold()

                if weightDecreased <= 0 {
                    Text("Decrease your weight by\nburning off \(sport.caloriesBurned) calories")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)

                    Button {
                        startExercise()
                    } label: {
                        Text("Start")
                            .font(.title2)
                            .frame(width: 200, height: 44)
                    }
                    .buttonStyle(.borderedProminent)
                }
                else {
                    Text("Weight decreased by \(String(format: "%.2f", weightDecreased))kg")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)

                }
            }
        }
        .navigationTitle("Exercising")
        .navigationBarTitleDisplayMode(.inline)
    }

    func startExercise() {
        isStarted = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            secondsElapsed += 1
            if secondsElapsed > sport.duration {

                // TODO: Step 5 - Observe
                weightDecreased = user.performActivity(caloriesBurned: sport.caloriesBurned)
                timer.invalidate()
                isStarted = false
            }
        }
    }
}

#Preview {
    SportView(sport: Sport(name: "Badminton", caloriesBurned: 40))
}
