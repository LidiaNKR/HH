//
//  NavBar.swift
//  hh
//
//  Created by Лидия Некрасова on 19.03.2024.
//

import SwiftUI

struct MainNavBar: ViewModifier {

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: Theme.typeface(.title2)]
    }

    func body(content: Content) -> some View { content }
}

extension View {
    func mainNavBar() -> some View {
        self.modifier(MainNavBar())
    }
}
