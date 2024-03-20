//
//  VacanciesNetworkService.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import Foundation
import Combine

/// Протокол получения и декодирования данных из сети
protocol VacanciesNetworking {
    
    /// Создает запрос и обращается к сервису для загрузки данных
    /// - Returns: возвращает данные по вакансиям/ошибку
    func fetchVacancy() -> AnyPublisher<[Vacancy], Never>
}

final class VacanciesNetworkService: VacanciesNetworking {
    
    // MARK: - Properties
    
    static let shared: VacanciesNetworking = VacanciesNetworkService()
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Methods
    
    func fetchVacancy() -> AnyPublisher<[Vacancy], Never> {
        guard let url = APIURL.url else {
            return Just([Vacancy]())
                .eraseToAnyPublisher()
        }
        return networkManager.fetch(url)
            .map { (response: Vacancies) -> [Vacancy] in
                return response.vacancies }
            .replaceError(with: [Vacancy]())
            .eraseToAnyPublisher()
    }
}
