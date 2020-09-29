//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct DialogView: View {
    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    var body: some View {

        VStack(spacing: .spacing) {

            ForEach(self.dialogViewModel.messages) { message in

                MessageView(message: message)
            }
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(dialogViewModel: DialogViewModel(messages:
        ["Hi and welcome", 
         "This is a second message, should be multiline",
         "Third message one"
        ]
        ))
    }
}
