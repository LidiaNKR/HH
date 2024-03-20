//
//  VacancyDescriptionCoordinatorView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Координатор вью страницы вакансии
struct VacancyDescriptionCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: VacancyDescriptionCoordinator
    
    // MARK: - Body
    
    var body: some View {
        VacancyDescriptionView(viewModel: coordinator.viewModel(for: .vacancy))
    }
}
