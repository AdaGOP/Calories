//
//  ProfileView.swift
//  Calories
//
//  Created by William Chrisandy on 07/05/25.
//

import SwiftUI

struct ProfileView: View {
    let user: Contact = Contact.me

    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .fontWeight(.light)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.top, 40)
                .padding(.bottom, 12)

            VStack(spacing: 8) {
                Text(user.name)
                    .font(.largeTitle)
                    .bold()

                // TODO: Step 4 - Observe
                Text("Weight: \(String(format: "%.2f", user.weight))kg")
                    .font(.title3)
            }

            Spacer()
        }
    }
}
