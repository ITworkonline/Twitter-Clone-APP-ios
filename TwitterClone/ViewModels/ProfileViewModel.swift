//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by skidnp on 1/11/22.
//

import SwiftUI
import Firebase
class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followerRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followerRef.document(currentUid).delete { _ in
                self.isFollowed = false
            }
            
        }
    }
        
    func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        followingRef.document(user.id).getDocument{ snapshot, _ in
            guard let isFollowed = snapshot?.exists else {return}
            self.isFollowed = isFollowed
        }
    }
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.userTweets = documents.map({Tweet(dictionary: $0.data())})
            
            print("DEBUG: USER tweets")
        }
    }
    
    func fetchLikedTweets() {
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments {
            snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweetIDs = documents.map({$0.documentID})
            
            tweetIDs.forEach { id in
                COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else {return}
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    guard tweets.count == tweetIDs.count else {return}
                    
                    self.likedTweets = tweets
                }
            }
        }
    }
    
    func tweets(forFilter filter: TweetFilterOptions)->[Tweet] {
        switch filter {
        case .tweets: return userTweets
        case .likes: return likedTweets
        }
    }
    
}

