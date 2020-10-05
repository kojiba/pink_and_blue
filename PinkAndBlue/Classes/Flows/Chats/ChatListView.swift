//
// Created by Illia Kucheriavyi
// For PinkAndBlue Team Hackathon
//

import SwiftUI

struct ChatListView: View {

    @State var chats: [ChatItemViewModel] = [
        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),
        
        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),

        ChatItemViewModel(icon: "person.circle.fill",
            name: "Joahna",
            lastMessagePreview: "Message preview",
            lastMessageTime: "9:41 AM"),
    ]


    var body: some View {
        ScrollView {
            VStack {
                ForEach(self.chats) { chat in
                    ChatItemView(viewModel: chat)
                }
            }
        }
            .navigationBarTitle("Suggested Groups", displayMode: .inline)
    }
}
