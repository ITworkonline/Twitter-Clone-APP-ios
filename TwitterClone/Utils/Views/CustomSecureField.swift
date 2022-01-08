//
//  CustomSecureField.swift
//  TwitterClone
//
//  Created by skidnp on 1/7/22.
//

import SwiftUI

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
                
            }
                HStack(spacing: 16) {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    SecureField("", text: $text)
                }
            
        }
    }
}
}
