//
//  DataManager.swift
//  hh
//
//  Created by Лидия Некрасова on 17.03.2024.
//

import Foundation

protocol DataManagerProtocol: ObservableObject {
    /// Удаление/добавление вакансии в избранное
    func saveFavoriteStatus(for id: String, with value: Bool)
    /// Получение статуса объявления: в избранном/ не в избранном
    func getFavoriteStatus(for id: String) -> Bool
    /// Количество объявлений в избранном
    var favoriteVacanciesCount: Int { get }
}

final class DataManager: DataManagerProtocol {
    
    /// Ключи для UserDefaults
    struct UserDefaultsKeys {
        static let key = "favorites"
    }
    
    // MARK: - Properties
    
    @Published var favoriteVacanciesCount: Int
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    // MARK: - Initializers
    
    init() {
        favoriteVacanciesCount = userDefaults.array(forKey: UserDefaultsKeys.key)?.count ?? .zero
    }
    
    // MARK: - Methods
    
    func saveFavoriteStatus(for id: String, with value: Bool) {
        var favorites = userDefaults.array(forKey: UserDefaultsKeys.key) as? [String] ?? [String]()
        
        
        if value {
            favorites.append(id)
        } else {
            favorites = favorites.filter { $0 != id }
        }
        userDefaults.set(favorites, forKey: UserDefaultsKeys.key)
        
        favoriteVacanciesCount = favorites.count
    }
    
    func getFavoriteStatus(for id: String) -> Bool {
        guard
            let array = userDefaults.array(forKey: UserDefaultsKeys.key) as? [String]
        else { return false }
        
        return array.contains(id)
    }
}
