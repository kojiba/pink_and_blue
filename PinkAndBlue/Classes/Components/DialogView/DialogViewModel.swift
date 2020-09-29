//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import Foundation

class DialogViewModel: ObservableObject {

    @Published var messages: [MessageViewModel]

    init(messages: [MessageViewModel]) {

        self.messages = messages
    }
}
