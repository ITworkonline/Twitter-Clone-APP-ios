//
//  LazyView.swift
//  TwitterClone
//
//  Created by skidnp on 1/16/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build:@autoclosure @escaping() -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

