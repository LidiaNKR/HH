//
//  VacancyDescriptionView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

/// Вью страницы вакансии
struct VacancyDescriptionView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let spacing: CGFloat = 16
        static let topPadding: CGFloat = 2
        static let bottomPaddingS: CGFloat = 4
        static let bottomPaddingM: CGFloat = 10
        static let bottomPaddingL: CGFloat = 14
        static let buttonHeight: CGFloat = 48
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VacancyDescriptionViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                NavBar(isFavourite: viewModel.isFavorite,
                       backAction: viewModel.back,
                       likeAction: viewModel.favoriteButtonPressed)
                .padding(.bottom, Constants.bottomPaddingM)
                .padding(.top, Constants.topPadding)
                
                TopView(title: viewModel.vacancy.title,
                        salary: viewModel.vacancy.salary.full,
                        experience: viewModel.vacancy.experience.text,
                        schedules: viewModel.schedules)
                .padding(.bottom, Constants.bottomPaddingL)
                
                ActivityBlockView(
                    activities: [ActivityViewModel(
                        text: viewModel.appliedNumber,
                        icon: "person"),
                                 ActivityViewModel(
                                    text: viewModel.lookingNumber,
                                    icon: "eye")]
                )
                .padding(.bottom, Constants.bottomPaddingS)
                
                MapBlockView(company: viewModel.vacancy.company,
                             address: viewModel.address)
                if let description = viewModel.vacancy.description {
                    CompanyDescriptionView(text: description)
                }
                
                ResponsibilitiesBlockView(
                    text: viewModel.vacancy.responsibilities
                )
                .padding(.bottom)
                
                QuestionBlockView(questions: viewModel.vacancy.questions)
                
                Button("respond".localized,
                       action: {})
                .buttonStyle(MainButtonStyle(style:
                        .filled(color: .special(.green),
                                cornerRadius: Constants.cornerRadius),
                                             height: Constants.buttonHeight,
                                             font: .buttonText1))
            }
            .padding(.all)
        }
        .background(Theme.color(.shadow(.shadows)))
        .navigationBarBackButtonHidden()
    }
}
