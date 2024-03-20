//
//  LoginViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

///Навигация модуля входа
enum LoginNavigation: Equatable {
    case enter(email: String)
}

// View Model для модуля входа
final class LoginViewModel: ObservableObject,
                            Navigable {
    
    // MARK: - Properties
    
    var onNavigation: ((LoginNavigation) -> Void)?
    
    // MARK: - Methods
    
    func continueButtonTapped(email: String) {
        if let onNavigation {
            onNavigation(.enter(email: email))
        }
    }
}
