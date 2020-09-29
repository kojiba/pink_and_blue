//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import Foundation

class DialogViewModel: ObservableObject {

    var messages: [MessageViewModel]

    init(messages: [String]) {

        self.messages = messages.map { MessageViewModel(text: $0) }
    }
}
