//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    let animationTime = 0.2

    var body: some View {
        VStack {
            DialogView(viewModel: dialogViewModel)
        }
            .onAppear(perform: onAppear)
    }

    private func onAppear() {
        DispatchQueue.global().async {

            self.addMessageInMain(.message("Hi and welcome to Breast Cancer Journey Companion."))
            sleep(1)

            self.addMessageInMain(.message("""
                         We want to provide you with a 24/7 
                         community of survivors at different stages 
                         in their journey to support you along yours. 
                         """))
            sleep(1)
            self.addMessageInMain(.message("Now let’s get you connected!"))

            sleep(1)
            self.addMessagesInMain([.option("Option one"), .option("Option two"), .option("Option three")])

        }
    }

    private func addMessageInMain(_ message: MessageViewModel) {
        DispatchQueue.main.async {

            withAnimation(.easeInOut(duration: self.animationTime)) {
                self.dialogViewModel.messages.append(message)
            }
        }
    }

    private func addMessagesInMain(_ messages: [MessageViewModel]) {
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: self.animationTime)) {
                self.dialogViewModel.messages.append(contentsOf: messages)
            }
        }
    }
}
