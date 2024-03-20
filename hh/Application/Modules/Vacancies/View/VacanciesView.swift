//
//  VacanciesView.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import SwiftUI

/// Вью модуля списка вакансий
struct VacanciesView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let bottomPaddingS: CGFloat = 8
        static let bottomPaddingM: CGFloat = 24
        static let topPadding: CGFloat = 16
        static let buttonHeight: CGFloat = 48
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VacanciesViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            
            SearchBar()
                .padding(.horizontal)
                .padding(.bottom, Constants.bottomPaddingM)
            
                RecommendationsLazyGrid(recomenrations: [
                    RecomendationViewModel(icon: "point",
                                           title: "vacanciesNearYou".localized,
                                           buttonColor: .special(.darkBlue)),
                    RecomendationViewModel(icon: "star",
                                           title: "getUpResume".localized,
                                           buttonTitle: "getUpButtonTitle".localized,
                                           buttonColor: .special(.darkGreen)),
                    RecomendationViewModel(icon: "file",
                                           title: "temporaryWork".localized,
                                           buttonColor: .special(.darkGreen))
                ])
                .padding(.bottom, Constants.bottomPaddingS)
            
            VStack(alignment: .leading, spacing: Constants.topPadding) {
                
                VacanciesLazyGrid(vacancies: viewModel.vacanciesModel,
                                  headerTitle: viewModel.title) { id in
                    viewModel.favoriteButtonPressed(id: id)
                } itemDidTap: { index in
                    viewModel.showItem(index: index)
                }
                
                Button("Еще \(viewModel.vacancies.count.setDeclention(wordType: .vacancy)) ",
                       action: {})
                .buttonStyle(MainButtonStyle(style: .filled(
                    color: .special(.blue),
                    cornerRadius: Constants.cornerRadius),
                                             height: Constants.buttonHeight,
                                             font: .buttonText1))
            }
            .padding(.horizontal)
            .padding(.bottom, Constants.bottomPaddingS)
        }
        .padding(.top, Constants.topPadding)
        .onAppear{
            viewModel.getVacancy()
        }
    }
}
