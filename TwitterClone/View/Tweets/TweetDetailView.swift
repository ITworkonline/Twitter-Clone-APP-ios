//
//  TweetDetailView.swift
//  TwitterClone
//
//  Created by skidnp on 1/15/22.
//

import SwiftUI
import KingfisherSwiftUI

struct TweetDetailView: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
            
                VStack(alignment: .leading, spacing: 4) {
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    Text(tweet.username)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("&;00 pm")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            HStack(spacing: 12) {
                HStack(spacing:4){
                    Text("a")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                HStack(spacing:4){
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Divider()
            
            TweetActionsView(tweet: tweet)
            
            Spacer()
        }.padding()
    }
}
