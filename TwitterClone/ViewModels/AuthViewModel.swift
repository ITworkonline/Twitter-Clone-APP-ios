//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by skidnp on 1/8/22.
//

import SwiftUI
import Firebase
class AuthViewModel: ObservableObject {
    func login() {
        
    }
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully signed up user...")
        }
    }
}
