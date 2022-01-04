//
//  TweetCell.swift
//  TwitterClone
//
//  Created by skidnp on 1/3/22.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top){
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Jie")
                            .font(.system(size:14, weight: .semibold))
                        Text("@batman •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)

                    }
                    
                    Text("sjhcajvc ascgajd cguacad qaccbhwegcyueqeqe hhjvgvgvjgvgvj")
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size:16))
                        .frame(width: 32, height: 32)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size:16))
                        .frame(width: 32, height: 32)
                })
                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .font(.system(size:16))
                        .frame(width: 32, height: 32)
                })
                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size:16))
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
