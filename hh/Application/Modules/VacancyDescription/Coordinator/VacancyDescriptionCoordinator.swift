//
//  VacancyDescriptionCoordinator.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

///Навигация модуля вакансии
enum VacancyCoordinatorNavigation {
    case vacancy
}

///Координатор модуля вакансии
final class VacancyDescriptionCoordinator: Coordinator {
    
    // MARK: - Properties
    
    @Published var navigationStack: [(VacancyCoordinatorNavigation, Any)] = []
    var onFinish: (() -> Void)?
    
    // MARK: - Initializers
    
    init(vacancy: Vacancy) {
        let viewModel = VacancyDescriptionViewModel(vacancy: vacancy)
        viewModel.onNavigation = { [weak self] navigation in
            guard let self else { return }
            
            switch navigation {
            case .back:
                onFinish?()
            }
        }
        pushToNavigationStack(.vacancy, viewModel: viewModel)
    }
}
