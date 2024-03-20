//
//  AppCoordinator.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import Foundation

///Тип списка: вакансии/избранные вакансии
enum Feed: LocalizedStringResource {
    case vacancies = "vacanciesTitle"
    case favorites = "favoritesTitle"
}

enum GeneralCoordinatorNavigation {
    case loginCoordinator
    case vacanciesCoordinator
    case favoritesCoordinator
}

/// Основной Координатор
final class AppCoordinator: ObservableObject, Coordinator {
    
    // MARK: - Properties
    
    @Published var navigationStack: [(GeneralCoordinatorNavigation, Any)] = []
    
    @Published var isRegistrationCompleted = false
    
    // MARK: - Initializers
    
    init() {
        pushToNavigationStack(.loginCoordinator, viewModel: RegistrationCoordinator(coordinator: self))
        pushToNavigationStack(.vacanciesCoordinator, viewModel: VacanciesCoordinator(feed: .vacancies))
        pushToNavigationStack(.favoritesCoordinator, viewModel: VacanciesCoordinator(feed: .favorites))
    }
}
