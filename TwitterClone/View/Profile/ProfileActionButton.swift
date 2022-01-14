//
//  ProfileActionButton.swift
//  TwitterClone
//
//  Created by skidnp on 1/5/22.
//

import SwiftUI

struct ProfileActionButton: View {
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    
    var body: some View {
        if viewModel.user.isCurrentUser {
        Button(action: {}, label: {
            Text("Edit Profile")
                .frame(width: 360, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
        })
            .cornerRadius(20)
        } else {
            HStack {
                Button(action: {
                    isFollowed ? viewModel.unfollow(): viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }).cornerRadius(20)
                Button(action: {}, label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                })
                    .cornerRadius(20)
            }
        }
    }
    
}

