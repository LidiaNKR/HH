//
//  VacanciesLazyGrid.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью со списком вакансий
struct VacanciesLazyGrid: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 16
    }
    
    // MARK: - Properties
    
    private let vacancies: [VacancyViewModel]
    private let headerTitle: String?
    private let likeDidTap: (String) -> Void
    private let itemDidTap: (Int) -> Void
    private let columns: [GridItem] = [.init(.flexible(), spacing: .zero)]
    
    // MARK: - Initializers
    
    init(vacancies: [VacancyViewModel],
         headerTitle: String? = nil,
         likeDidTap: @escaping (String) -> Void,
         itemDidTap: @escaping (Int) -> Void) {
        self.vacancies = vacancies
        self.headerTitle = headerTitle
        self.itemDidTap = itemDidTap
        self.likeDidTap = likeDidTap
    }
    
    // MARK: - Body
    
    var body: some View {
        if let headerTitle {
            Text(headerTitle)
                .font(Theme.typeface(.title2))
                .foregroundColor(Theme.color(.basic(.white)))
        }
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: Constants.spacing,
                  pinnedViews: .sectionHeaders) {
            Section {
                
                ForEach(Array(vacancies.enumerated()),
                        id: \.element) { index, vacancy in
                    VacancyView(vacancy:
                                    VacancyViewModel(id: vacancy.id,
                                                     isFavourite: vacancy.isFavourite,
                                                     lookingNumber: vacancy.lookingNumber,
                                                     title: vacancy.title,
                                                     salary: vacancy.salary,
                                                     town: vacancy.town,
                                                     company: vacancy.company,
                                                     experience: vacancy.experience,
                                                     publishedDate: vacancy.publishedDate,
                                                     likeAction: { likeDidTap(vacancy.id) })
                    )
                    .onTapGesture {
                        itemDidTap(index)
                    }
                }
            }
        }
    }
}

