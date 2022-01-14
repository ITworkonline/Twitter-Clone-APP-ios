//
//  ContentView.swift
//  TwitterClone
//
//  Created by skidnp on 1/3/22.
//

import SwiftUI
import KingfisherSwiftUI
struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        SearchView()
                            .tabItem{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationView()
                            .tabItem{
                                Image(systemName: "envelope")
                                Text("Message")
                            }
                    }
                    .navigationBarTitle("Home")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        if let user = viewModel.user {
                            KFImage(URL(string:user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            }else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
