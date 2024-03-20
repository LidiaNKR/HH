//
//  hhApp.swift
//  hh
//
//  Created by Лидия Некрасова on 13.03.2024.
//

import SwiftUI

@main
struct hhApp: App {
    
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(coordinator)
                .environment(\.colorScheme, .dark)
        }
    }
}
