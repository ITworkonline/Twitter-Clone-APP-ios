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
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<10) { tweet in
//                    TweetCell()
//                        .padding()
                }
            }
            .navigationTitle("batman")
        }
    }
}

