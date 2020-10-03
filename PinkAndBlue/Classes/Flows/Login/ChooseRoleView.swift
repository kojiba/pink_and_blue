//
// Created by kojiba on 01.10.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct ChooseRoleView: View {

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    @State private var isNavigatingNext = false

    let animationTime = 0.2

    var body: some View {
        VStack {
            DialogView(viewModel: dialogViewModel)

            NavigationLink(destination: ChooseTypeView(), isActive: $isNavigatingNext) {
                EmptyView()
            }
        }
            .navigationBarTitle("Choose Role", displayMode: .inline)
            .onAppear(perform: onAppear)
    }

    private func onAppear() {

        if self.dialogViewModel.messages.count > 0 {
            return
        }

        DispatchQueue.global().async {
            self.dialogViewModel.addMessageAsyncAnimated(.message("How are you related to the breast cancer?"))

            sleep(1)
            self.self.dialogViewModel.addMessagesAsyncAnimated([
                .option("I was recently diagnosed", action: self.showChats),
                .option("Someone I love has breast cancer/I’m a caregiver", action: self.showChats),
                .option("I have been living with breast cancer", action: self.showChats),
                .option("My cancer is in remission", action: self.showChats)
            ])

        }
    }

    private func showChats(_: MessageViewModel) {
        self.isNavigatingNext = true
    }
}
