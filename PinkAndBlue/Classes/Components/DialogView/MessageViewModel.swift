//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import Foundation

class MessageViewModel: ObservableObject, Identifiable {
    typealias Action = (_:MessageViewModel) -> Void

    var id: String = UUID().uuidString

    let isOption: Bool
    let text: String

    let action: Action?

    private init(text: String, isOption: Bool, action: Action? = nil) {
        self.text = text
        self.isOption = isOption
        self.action = action
    }

    static func message(_ text: String) -> MessageViewModel {
        MessageViewModel(text: text, isOption: false)
    }

    static func option(_ text: String, action: Action? = nil) -> MessageViewModel {
        MessageViewModel(text: text, isOption: true, action: action)
    }
}