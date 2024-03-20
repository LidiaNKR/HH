//
//  LazyLoadView.swift
//  hh
//
//  Created by Лидия Некрасова on 17.03.2024.
//

import SwiftUI

struct LazyLoadView<Content: View>: View {
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
