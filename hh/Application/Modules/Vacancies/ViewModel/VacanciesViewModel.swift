//
//  VacanciesViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import Combine

///Навигация модуля списка вакансии / избранных вакансий
enum VacanciesNavigation: Equatable {
    case selectItem(vacancy: Vacancy)
}

// View Model модуля списка вакансий / избранных вакансий
final class VacanciesViewModel: ObservableObject, Navigable {
    
    // MARK: - Properties
    
    @Published var vacancies = [Vacancy]()
    @Published var vacanciesModel = [VacancyViewModel]()
    
    var onNavigation: ((VacanciesNavigation) -> Void)?
    
    var title: String {
        return String(localized: feed.rawValue)
    }
    
    var vacanciesCount: String {
        vacanciesModel.count.setDeclention(wordType: .vacancy)
    }
    
    private let vacanciesNetworkService: VacanciesNetworking
    private let feed: Feed
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init(vacanciesNetworkService: VacanciesNetworking,
         feed: Feed) {
        self.vacanciesNetworkService = vacanciesNetworkService
        self.feed = feed
    }
    
    // MARK: - Internal Methods
    
    func getVacancy() {
        vacanciesNetworkService.fetchVacancy()
            .sink { [ weak self ] vacancy in
                guard let self else { return }
                
                switch feed {
                case .vacancies:
                    vacancies = vacancy
                    if vacancy.count > 3 {
                        let arraySlice = vacancy.prefix(3)
                        vacancies = Array(arraySlice)
                    }
                case .favorites:
                    vacancies = vacancy.filter{
                        DataManager.shared.getFavoriteStatus(for: $0.id.uuidString) == true
                    }
                }
                vacanciesModel = mapVacancies(vacancies: vacancies)
            }
            .store(in: &cancellableSet)
    }
    
    func getFavoriteStatus(id: String) -> Bool {
        DataManager.shared.getFavoriteStatus(for: id)
    }
    
    func favoriteButtonPressed(id: String) {
        var status = DataManager.shared.getFavoriteStatus(for: id)
        status.toggle()
        DataManager.shared.saveFavoriteStatus(for: id, with: status)
        
        if feed == .favorites {
            vacanciesModel = vacanciesModel.filter{
                DataManager.shared.getFavoriteStatus(for: $0.id) == true
            }
        } else {
            vacanciesModel = mapVacancies(vacancies: vacancies)
        }
    }
    
    func showItem(index: Int) {
        if let onNavigation {
            onNavigation(.selectItem(vacancy: vacancies[index]))
        }
    }
    
    // MARK: - Private Methods
    
    private func mapVacancies(vacancies: [Vacancy]) -> [VacancyViewModel] {
        return vacancies.map {
            VacancyViewModel(id: $0.id.uuidString,
                             isFavourite: getFavoriteStatus(id: $0.id.uuidString),
                             lookingNumber: $0.lookingNumber,
                             title: $0.title,
                             salary: $0.salary.short,
                             town: $0.address.town,
                             company: $0.company,
                             experience: $0.experience.previewText,
                             publishedDate: $0.publishedDate,
                             likeAction: {})
        }
    }
}
