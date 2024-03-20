//
//  NetworkManager.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import Foundation
import Combine

/// Протокол получения и декодирования данных из сети
protocol NetworkManagement {
    
    /// Создает и направляет запрос в сеть для получения данных
    ///  - Parameters:
    ///     - url: URL запроса
    /// - Returns: возвращает дженерик "издателя"
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error>
}

final class NetworkManager: NetworkManagement {
    
    // MARK: - Properties
    
    static let shared: NetworkManagement = NetworkManager()
    
    // MARK: - Methods
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
