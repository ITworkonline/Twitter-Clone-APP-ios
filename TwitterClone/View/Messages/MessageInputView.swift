//
//  MessageInputView.swift
//  TwitterClone
//
//  Created by skidnp on 1/4/22.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var action: ()->Void
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minWidth: 30)
            
            Button(action: action, label: {
                Text("Send")
                    .bold()
                    .foregroundColor(.blue)
            })
        }
    }
}


