//
// Created by kojiba on 01.10.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct ChooseStageView: View {

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    @State private var isNavigatingNext = false

    let animationTime = 0.2

    var body: some View {
        VStack {
            DialogView(viewModel: dialogViewModel)

            NavigationLink(destination: ChatListView(), isActive: $isNavigatingNext) {
                EmptyView()
            }
        }
            .navigationBarTitle("Choose Stage", displayMode: .inline)
            .onAppear(perform: onAppear)
    }

    private func onAppear() {

        if self.dialogViewModel.messages.count > 0 {
            return
        }

        DispatchQueue.global().async {
            self.dialogViewModel.addMessageAsyncAnimated(.message("What is the current stage?"))

            sleep(1)
            self.dialogViewModel.addMessagesAsyncAnimated([
                .option("First stage (I)", action: self.showNext),
                .option("Second stage (II)", action: self.showNext),
                .option("Third stage (III)", action: self.showNext),
                .option("Fourth stage (IV)", action: self.showNext)
            ])

        }
    }

    private func showNext(_: MessageViewModel) {
        self.isNavigatingNext = true
    }
}
