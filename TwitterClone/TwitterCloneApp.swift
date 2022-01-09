//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by skidnp on 1/3/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           //ContentView()
            LoginView()
        }
    }
}
