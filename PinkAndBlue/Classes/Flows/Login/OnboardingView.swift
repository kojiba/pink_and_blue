//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import SwiftUI

struct OnboardingView: View {

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])
    
    @State private var isShowingLoginOptionsView = false

    let animationTime = 0.2

    @State private var isNavigatingLogin = false
    @State private var isNavigatingChooseRole = false
    @State private var isNavigatingChats = false

    var body: some View {
        NavigationView {
            VStack {
                DialogView(viewModel: dialogViewModel)

                if isShowingLoginOptionsView {

                    VStack {
                        Spacer(minLength: .spacing)

                        LoginOptionsView(facebook: navigateChooseRole,
                            twitter: navigateChooseRole,
                            signInUp: { self.isNavigatingLogin = true })
                    }
                        .transition(.move(edge: .bottom))
                }

                NavigationLink(destination: LoginView(), isActive: $isNavigatingLogin) { EmptyView() }
                NavigationLink(destination: ChooseRoleView(), isActive: $isNavigatingChooseRole) { EmptyView() }
                NavigationLink(destination: ChatListView(), isActive: $isNavigatingChats) { EmptyView() }
            }
                .edgesIgnoringSafeArea(.bottom)
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
                .onAppear(perform: onAppear)
        }
    }

    private func onAppear() {
        if self.dialogViewModel.messages.count > 0 {
            return
        }

        DispatchQueue.global().async {

            self.dialogViewModel.addMessageAsyncAnimated(.message("Hi and welcome to Breast Cancer Journey Companion."))
            
            sleep(1)
            self.dialogViewModel.addMessageAsyncAnimated(
                .message("""
                         We want to provide you with a 24/7 
                         community of survivors at different stages 
                         in their journey to support you along yours. 
                         """)
                )
            
            sleep(1)
            self.dialogViewModel.addMessageAsyncAnimated(.message("Now let’s get you connected!"))

            sleep(1)
            self.showLoginOptions()
        }
    }

    private func showLoginOptions() {
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: self.animationTime)) {
                self.isShowingLoginOptionsView = true
            }
        }
    }

    private func navigateChooseRole() {
        isNavigatingChooseRole = true
    }

    private func navigateChats() {
        isNavigatingChats = true
    }
}
