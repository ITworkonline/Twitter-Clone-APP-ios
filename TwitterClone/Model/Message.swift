//
//  Message.swift
//  TwitterClone
//
//  Created by skidnp on 1/4/22.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id:0, imageName: "spiderman", messageText: "What's up", isCurrentUser: false),
    .init(id:1, imageName: "batman", messageText: "Good", isCurrentUser: true),
    .init(id:2, imageName: "batman", messageText: "efwep", isCurrentUser: true),
    .init(id:3, imageName: "spiderman", messageText: "Wdqeqqfqw up", isCurrentUser: false),
    .init(id:4, imageName: "spiderman", messageText: "Wdqwd ffp", isCurrentUser: false),
    .init(id:5, imageName: "batman", messageText: "bye", isCurrentUser: true)
]
