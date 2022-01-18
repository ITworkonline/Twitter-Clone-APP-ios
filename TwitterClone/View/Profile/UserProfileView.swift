//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by skidnp on 1/5/22.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    let user: User

    @ObservedObject var viewModel:ProfileViewModel
    
    init(user:User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding()
                }
            }
            .navigationTitle(user.username)
        }
    }
}

