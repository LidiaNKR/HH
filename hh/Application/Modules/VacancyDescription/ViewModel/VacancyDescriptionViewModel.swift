//
//  VacancyDescriptionViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

///Навигация страницы вакансии
enum VacancyNavigation {
    case back
}

// View Model для модуля страницы вакансии
final class VacancyDescriptionViewModel: ObservableObject, Navigable {
    
    // MARK: - Properties
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavoriteStatus(for: vacancy.id.uuidString,
                                                  with: isFavorite)
        }
    }
    
    var onNavigation: ((VacancyNavigation) -> Void)?
    let vacancy: Vacancy
    
    var schedules: String {
        let arrayString = vacancy.schedules.joined(separator: ", ")
        return arrayString.capitalizingFirstLetter()
    }
    
    var appliedNumber: String? {
        if let appliedNumber = vacancy.appliedNumber {
            return "\(appliedNumber.setDeclention(wordType: .people))" + "responses".localized
        }
        return nil
    }
    
    var lookingNumber: String? {
        if let lookingNumber = vacancy.lookingNumber {
            return "\(lookingNumber.setDeclention(wordType: .people))" + "viewers".localized
        }
        return nil
    }
    
    var address: String {
        "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)"
    }
    
    // MARK: - Initializers
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        isFavorite = DataManager.shared.getFavoriteStatus(for: vacancy.id.uuidString)
    }
    
    // MARK: - Methods
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
    
    func back() {
        if let onNavigation {
            onNavigation(.back)
        }
    }
}

