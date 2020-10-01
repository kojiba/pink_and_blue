//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
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
        add(message: message, async: true)
    }

    func add(message: MessageViewModel, animated: Bool = true, async: Bool = false, animationTime: Double = animationTime) {
        let closure = { self.messages.append(message) }
        performOperation(closure: closure, animated: animated, async: async, animationTime: animationTime)
    }

    func add(messages: [MessageViewModel], animated: Bool = true, async: Bool = false, animationTime: Double = animationTime) {
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
