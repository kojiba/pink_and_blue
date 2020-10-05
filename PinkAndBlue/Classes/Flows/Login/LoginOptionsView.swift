//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import SwiftUI

struct RoundedButton: View {

    var title: String
    var background: Color
    var action: (() -> Void)?

    var body: some View {
        Button(action: { self.action?() }) {
            HStack {
                Spacer(minLength: .spacing)
                Text(title)
                    .foregroundColor(Color.white)
                    .padding(.vertical, .spacing)
                Spacer(minLength: .spacing)
            }
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(background)
                )
        }
    }
}

struct LoginOptionsView: View {

    var facebook: (() -> Void)?
    var twitter: (() -> Void)?
    var signInUp: (() -> Void)?

    var body: some View {
        VStack {
            VStack(spacing: .spacing) {
                RoundedButton(title: "Log in with Facebook", background: .facebook, action: facebook)
                RoundedButton(title: "Log in with Twitter", background: .twitter, action: twitter)
                RoundedButton(title: "Log in with Email", background: .systemPink, action: signInUp)
            }
                .padding(.all, .spacing)
                .padding(.bottom, .spacing)
        }
            .background(Color.systemGray5)
    }
}
