//
//  VacanciesCoordinator.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import Foundation

///Навигация страницы списка вакансий/ избранных вакансий
enum VacanciesCoordinatorNavigation {
    case feed
    case item
}

///Координатор страницы списка вакансий/ избранных вакансий
final class VacanciesCoordinator: Coordinator {
    
    // MARK: - Properties
    
    @Published var navigationStack: [(VacanciesCoordinatorNavigation, Any)] = []
    
    let vacanciesNetworking: VacanciesNetworking = VacanciesNetworkService.shared
    
    // MARK: - Initializers
    
    init(feed: Feed) {
        pushVacanciesCoordinator(feed: feed)
    }
    
    // MARK: - Methods
    
    private func pushVacanciesCoordinator(feed: Feed) {
        let viewModel = VacanciesViewModel(vacanciesNetworkService: vacanciesNetworking, feed: feed)
        viewModel.onNavigation = { [weak self] navigation in
            guard let self else { return }
            
            switch navigation {
            case .selectItem(let vacancy):
                pushDescriptionCoordinator(vacancy)
            }
        }
        pushToNavigationStack(.feed, viewModel: viewModel)
    }
    
    private func pushDescriptionCoordinator(_ vacancy: Vacancy) {
        let coordinator = VacancyDescriptionCoordinator(vacancy: vacancy)
        coordinator.onFinish = { [weak self] in
            guard let self else { return }
            
            popFromNavigationStack()
        }
        pushToNavigationStack(.item, viewModel: coordinator)
    }
}
