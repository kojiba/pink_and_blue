//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct DialogView: View {
    @ObservedObject var dialogViewModel: DialogViewModel

    var body: some View {

        VStack(spacing: .spacing) {

            ForEach(self.dialogViewModel.messages) { message in

                if message.isOption {
                    OptionMessageButton(message: message)
                } else {
                    MessageView(message: message)
                }
            }
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(dialogViewModel: DialogViewModel(messages:
        [.message("Hi and welcome"),
         .message("This is a second message, should be multiline"),
         .message("Third message one"),
         .option("Option one"),
         .option("Option two"),
         .option("Option three")
        ]
        ))
    }
}
