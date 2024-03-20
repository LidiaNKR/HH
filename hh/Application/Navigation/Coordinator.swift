//
//  Coordinator.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype NavigationItem: Equatable
    
    var navigationStack: [(NavigationItem, Any)] { get set }
}

extension Coordinator {
    func isActive(_ item: NavigationItem) -> Binding<Bool> {
        return .constant(navigationStack.contains(where: { $0.0 == item }))
    }
    
    func viewModel<T: ObservableObject>(for item: NavigationItem) -> T {
        guard let item = navigationStack.first(where: { $0.0 == item }) else {
            fatalError("Item not in stack.")
        }
        guard let viewModel = item.1 as? T else {
            fatalError("View model type is not correct.")
        }
        return viewModel
    }
    
    func pushToNavigationStack(_ item: NavigationItem, viewModel: Any) {
        navigationStack.append((item, viewModel))
    }
    
    func popFromNavigationStack() {
        navigationStack.removeLast()
    }
}
