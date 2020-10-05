//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}

struct DialogView: View {
    @ObservedObject var viewModel: DialogViewModel

    var body: some View {
        VStack(spacing: .spacing) {

            ForEach(self.viewModel.messages) { message in
                self.view(for: message)
            }
        }
            .padding(.vertical, .spacing)
    }

    func view(for message: MessageViewModel) -> AnyView {
        if message.isOption {
            return OptionMessageButton(message: message).toAnyView()
        } else {
            return MessageView(message: message).toAnyView()
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(viewModel: DialogViewModel(messages: [.message("Hi and welcome"),
                                                         .message("This is a second message, should be multiline"),
                                                         .message("Third message one"),
                                                         .option("Option one"),
                                                         .option("Option two"),
                                                         .option("Option three")
        ])
        )
    }
}
