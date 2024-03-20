//
//  FavoritesView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

/// Вью модуля списка избранных вакансий
struct FavoritesView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let topPadding: CGFloat = 8
        static let spacing: CGFloat = 16
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VacanciesViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .foregroundColor(Theme.color(.basic(.white)))
                    .font(Theme.typeface(.title2))
                    .padding(.top, Constants.topPadding)
                    .padding(.bottom, Constants.spacing)
                
                Text(viewModel.vacanciesCount)
                    .font(Theme.typeface(.text1))
                    .foregroundColor(Theme.color(.basic(.grey3)))
                
                VacanciesLazyGrid(vacancies: viewModel.vacanciesModel) { id in
                    viewModel.favoriteButtonPressed(id: id)
                } itemDidTap: { index in
                    viewModel.showItem(index: index)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, Constants.spacing)
        .onAppear{
            viewModel.getVacancy()
        }
    }
}
