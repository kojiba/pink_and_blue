//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

class ChatItemViewModel: ObservableObject, Identifiable {
    private(set) var id = UUID().uuidString

    var icon: String

    var name: String
    var lastMessagePreview: String

    var lastMessageTime: String

    init(icon: String,
         name: String,
         lastMessagePreview: String,
         lastMessageTime: String) {

        self.icon = icon
        self.name = name
        self.lastMessagePreview = lastMessagePreview
        self.lastMessageTime = lastMessageTime
    }
}

struct ChatItemView: View {
    @ObservedObject var viewModel: ChatItemViewModel

    var body: some View {
        VStack(spacing: .spacing) {
            HStack(spacing: .spacing) {
                Image(systemName: viewModel.icon)
                    .resizable()
                    .frame(width: 45, height: 45)

                VStack {
                    HStack {
                        Text(viewModel.name)
                            .font(Font.body.weight(.bold))
                            .foregroundColor(.label)

                        Spacer(minLength: .zero)

                        HStack {
                            Text(viewModel.lastMessageTime)
                                .font(Font.subheadline)
                                .foregroundColor(.secondaryLabel)

                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 5, height: 8)
                                .foregroundColor(.systemGray2)
                        }
                    }

                    HStack {
                        Text(viewModel.lastMessagePreview)
                            .font(Font.subheadline)
                            .foregroundColor(.secondaryLabel)

                        Spacer(minLength: .zero)
                    }
                }
            }
                .padding(.top, .halfSpacing)
                .padding(.trailing, 22)


            Divider()
                .foregroundColor(.systemGray5)
        }
            .padding(.leading, 28)
    }
}

struct ChatItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatItemView(viewModel:
        ChatItemViewModel(icon: "",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM")
        )
    }
}

