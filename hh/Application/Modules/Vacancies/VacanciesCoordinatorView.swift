//
//  VacanciesCoordinatorView.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import SwiftUI

///Координатор модуля списка вакансий
struct VacanciesCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: VacanciesCoordinator
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VacanciesView(viewModel: coordinator.viewModel(for: .feed))
            LazyNavigationLink(
                isActive: coordinator.isActive(.item),
                destination: {
                    VacancyDescriptionCoordinatorView(coordinator: coordinator.viewModel(for: .item))
                }
            )
        }
    }
}
