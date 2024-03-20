//
//  ActivityViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import Foundation

///Вью модель вью активности
struct ActivityViewModel: Hashable {
    
    let text: String?
    let icon: String
    
    static func == (lhs: ActivityViewModel, rhs: ActivityViewModel) -> Bool {
        lhs.text == rhs.text &&
        lhs.icon == rhs.icon
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(icon)
    }
}
