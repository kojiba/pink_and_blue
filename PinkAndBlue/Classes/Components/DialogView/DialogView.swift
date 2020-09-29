//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct DialogView: View {
    @ObservedObject var viewModel: DialogViewModel

    var body: some View {

        VStack(spacing: .spacing) {

            ForEach(self.viewModel.messages) { message in

                Group {
                    if message.isOption {
                        OptionMessageButton(message: message)
                    } else {
                        MessageView(message: message)
                    }
                }
                    .transition(.slide)
            }
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
