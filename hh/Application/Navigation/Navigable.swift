//
//  Navigable.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import Foundation

protocol Navigable {
    associatedtype NavigationItem: Equatable
    
    var onNavigation: ((NavigationItem) -> Void)? { get }
}
