//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct OptionMessageButton: View {
    @ObservedObject var message: MessageViewModel

    var body: some View {
        HStack {
            Spacer(minLength: 20)
            
            Button(action: self.optionClicked) {
                Text(message.text)
                    .padding(.vertical, .halfSpacing)
                    .padding(.horizontal, .spacing)
                    .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(lineWidth: 1))
            }
        }
            .padding(.trailing, .halfSpacing)
    }

    func optionClicked() {

    }
}


struct OptionMessageButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OptionMessageButton(message: .option("Option #1"))
            OptionMessageButton(message: .option("Option two"))
            OptionMessageButton(message: .option("Option three and possibly a big one multiline option here for previews"))

        }
    }
}

