//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import Foundation
import SwiftUI

class DialogViewModel: ObservableObject {

    @Published private(set) var messages: [MessageViewModel]

    static let animationTime = 0.2

    init(messages: [MessageViewModel]) {

        self.messages = messages
    }

    func addMessageAsyncAnimated(_ message: MessageViewModel) {
        add(message: message, animated: true, async: true)
    }


    func addMessagesAsyncAnimated(_ messages: [MessageViewModel]) {
        add(messages: messages, animated: true, async: true)
    }

    func add(message: MessageViewModel, animated: Bool = false, async: Bool = false, animationTime: Double = animationTime) {
        let closure = { self.messages.append(message) }
        performOperation(closure: closure, animated: animated, async: async, animationTime: animationTime)
    }

    func add(messages: [MessageViewModel], animated: Bool = false, async: Bool = false, animationTime: Double = animationTime) {
        let closure = { self.messages.append(contentsOf: messages) }
        performOperation(closure: closure, animated: animated, async: async, animationTime: animationTime)
    }

    private func performOperation(closure: @escaping () -> (), animated: Bool, async: Bool, animationTime: Double) {
        let animatedClosure = animated
                              ?
                              {
                                  withAnimation(.easeInOut(duration: animationTime)) {
                                      closure()
                                  }
                              }
                              : closure

        let syncClosure = async
                          ?
                          {
                              DispatchQueue.main.async {
                                  animatedClosure()
                              }
                          }
                          :
                          animatedClosure

        syncClosure()
    }
}
