//
//  RecomendationViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

///Вью модель рекомендаций
struct RecomendationViewModel: Hashable {
    let icon: String
    let title: String
    let buttonTitle: String?
    let buttonColor: ColorType
    
    static func == (lhs: RecomendationViewModel, rhs: RecomendationViewModel) -> Bool {
        lhs.icon == rhs.icon &&
        lhs.title == rhs.title &&
        lhs.buttonTitle == rhs.buttonTitle &&
        lhs.buttonColor == rhs.buttonColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(icon)
        hasher.combine(title)
        hasher.combine(buttonTitle)
        hasher.combine(buttonColor)
    }
    
    init(icon: String,
         title: String,
         buttonTitle: String? = nil,
         buttonColor: ColorType) {
        self.icon = icon
        self.title = title
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
    }
}
