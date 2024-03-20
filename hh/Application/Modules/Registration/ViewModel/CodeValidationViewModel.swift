//
//  CodeValidationViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

///Навигация страницы ввода СМС
enum CodeValidationNavigation {
    ///Завершение процесса регистрации
    case complete
}

// View Model для модуля ввоода смс кода
final class CodeValidationViewModel: ObservableObject,
                                     Navigable {
    
    // MARK: - Properties
    
    @Published var isValidPassword: Bool = false
    
    let email: String
    var onNavigation: ((CodeValidationNavigation) -> Void)?
    
    // MARK: - Initializers
    
    init(email: String) {
        self.email = email
    }
    
    // MARK: - Methods
    
    func updateValue(newValue: Bool) {
        isValidPassword = newValue
    }
    
    func confirmButtonTapped() {
        if let onNavigation {
            onNavigation(.complete)
        }
    }
}
