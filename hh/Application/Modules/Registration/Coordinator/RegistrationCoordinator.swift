//
//  RegistrationCoordinator.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import Foundation

///Навигация модуля регистрации
enum RegistrationCoordinatorNavigation {
    ///Переход к модулю входа
    case login
    ///Переход к модулю ввода СМС-кода
    case enteringCode
}

final class RegistrationCoordinator: Coordinator {
    @Published var navigationStack: [(RegistrationCoordinatorNavigation, Any)] = []
    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        
        pushLoginCoordinator()
    }
    
    ///Навигация модуля входа
    private func pushLoginCoordinator() {
        let viewModel = LoginViewModel()
        viewModel.onNavigation = { [weak self] navigation in
            guard let self else { return }
            
            switch navigation {
            case .enter(let email):
                pushCodeValidationCoordinator(email)
            }
        }
        pushToNavigationStack(.login, viewModel: viewModel)
    }
    
    ///Навигация модуля ввода СМС-кода
    private func pushCodeValidationCoordinator(_ email: String) {
        let viewModel = CodeValidationViewModel(email: email)
        viewModel.onNavigation = { [weak self] navigation in
            guard let self else { return }
            
            switch navigation {
            case .complete:
                coordinator?.isRegistrationCompleted = true
            }
        }
        pushToNavigationStack(.enteringCode, viewModel: viewModel)
    }
}
