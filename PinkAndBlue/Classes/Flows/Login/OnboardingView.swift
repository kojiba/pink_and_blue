//
// Created by kojiba on 29.09.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {

    @State var isShowingChats = false
    @State var isShowingLoginOptionsView = false

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])

    let animationTime = 0.2

    var body: some View {
        NavigationView {
            VStack {
                DialogView(viewModel: dialogViewModel)

                if isShowingLoginOptionsView {

                    VStack {
                        Spacer(minLength: .spacing)

                        LoginOptionsView(facebook: {},
                            twitter: {},
                            signInUp: {})
                    }
                        .transition(.move(edge: .bottom))
                }

                NavigationLink(destination: ChatListView(), isActive: $isShowingChats) { EmptyView() }
            }
                .edgesIgnoringSafeArea(.bottom)
                .onAppear(perform: onAppear)
        }
    }

    private func onAppear() {
        if self.dialogViewModel.messages.count > 0 {
            return
        }

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
            self.showLoginOptions()
        }
    }

    private func addMessageInMain(_ message: MessageViewModel) {
        DispatchQueue.main.async {

            withAnimation(.easeInOut(duration: self.animationTime)) {
                self.dialogViewModel.messages.append(message)
            }
        }
    }

    private func showLoginOptions() {
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: self.animationTime)) {
                self.isShowingLoginOptionsView = true
            }
        }
    }

    private func showChats(_: MessageViewModel) {
        self.isShowingChats = true
    }
}
