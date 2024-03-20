//
//  FavoritesCoordinatorView.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import SwiftUI

///Координатор модуля списка избранных вакансий
struct FavoritesCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: VacanciesCoordinator
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            FavoritesView(viewModel: coordinator.viewModel(for: .feed))
            LazyNavigationLink(
                isActive: coordinator.isActive(.item),
                destination: {
                    VacancyDescriptionCoordinatorView(coordinator: coordinator.viewModel(for: .item))
                }
            )
        }
    }
}
