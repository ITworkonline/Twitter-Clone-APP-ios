//
//  ProfileHeaderView.swift
//  TwitterClone
//
//  Created by skidnp on 1/5/22.
//

import SwiftUI
import KingfisherSwiftUI

struct ProfileHeaderView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    @Binding var isFollowed: Bool
    let viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("chebvjwevbjwe dcbjwecb")
                .font(.system(size:14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButton(viewModel: viewModel, isFollowed: $isFollowed)
            
            Spacer()
        }
    }
}
