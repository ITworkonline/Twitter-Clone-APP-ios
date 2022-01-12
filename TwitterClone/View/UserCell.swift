//
//  UserCell.swift
//  TwitterClone
//
//  Created by skidnp on 1/4/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12){
            Image("venom-10")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4){
                Text("venom")
                    .font(.system(size: 14, weight:.semibold))
                Text("JJJ")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
                
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
