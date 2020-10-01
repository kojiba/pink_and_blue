//
// Created by kojiba on 01.10.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct ChooseRoleView: View {

    @State var isShowingChats = false
    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    let animationTime = 0.2

    var body: some View {
        NavigationView {
            VStack {
                DialogView(viewModel: dialogViewModel)
            }
                .onAppear(perform: onAppear)
        }
    }
    
    private func onAppear() {

        if self.dialogViewModel.messages.count > 0 {
            return
        }

        DispatchQueue.global().async {
            self.addMessageInMain(.message("How are you related to the breast cancer?"))
            
            sleep(1)
            self.addMessagesInMain([
                .option("I was recently diagnosed", action: self.showChats),
                .option("Someone I love has breast cancer/I’m a caregiver", action: self.showChats),
                .option("I have been living with breast cancer", action: self.showChats),
                .option("My cancer is in remission", action: self.showChats)
            ])

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

    private func showChats(_: MessageViewModel) {
        self.isShowingChats = true
    }
}
