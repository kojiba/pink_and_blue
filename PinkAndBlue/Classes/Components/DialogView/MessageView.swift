//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import SwiftUI

struct MessageView: View {
    @ObservedObject var message: MessageViewModel

    var body: some View {
        HStack {
            Text(message.text)
                .padding([.leading, .trailing, .top], 7)
                .padding(.bottom, 14)
                
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color.systemGray5))
                .padding(.leading, .halfSpacing)


            Spacer(minLength: 20)
        }
    }
}
