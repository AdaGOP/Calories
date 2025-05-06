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

    var completion: Double {
        let percentage = Double(secondsElapsed)/Double(sport.duration)
        return percentage >= 1 ? 1 : percentage
    }

    var body: some View {
        VStack {
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
        .navigationTitle("Exercising")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: handleTimer)
    }

    func handleTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            secondsElapsed += 1
            if secondsElapsed > sport.duration {
                user.performActivity(caloriesBurned: sport.caloriesBurned)
                timer.invalidate()
                dismiss()
            }
        }
    }
}

#Preview {
    SportView(sport: Sport(name: "Badminton", caloriesBurned: 40))
}
