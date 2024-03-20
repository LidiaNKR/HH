//
//  VacancyViewModel.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью модель вакансии
struct VacancyViewModel: Hashable {
    
    let id: String
    var isFavourite: Bool
    var lookingNumber: Int?
    let title: String
    var salary: String?
    let town: String
    let company: String
    let experience: String
    let publishedDate: String
    let likeAction: () -> Void
    
    static func == (lhs: VacancyViewModel, rhs: VacancyViewModel) -> Bool {
        lhs.id == rhs.id &&
        lhs.isFavourite == rhs.isFavourite &&
        lhs.lookingNumber == rhs.lookingNumber &&
        lhs.salary == rhs.salary &&
        lhs.company == rhs.company &&
        lhs.experience == rhs.experience &&
        lhs.publishedDate == rhs.publishedDate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(isFavourite)
        hasher.combine(lookingNumber)
        hasher.combine(salary)
        hasher.combine(company)
        hasher.combine(experience)
        hasher.combine(publishedDate)
    }
    
    init(id: String,
         isFavourite: Bool,
         lookingNumber: Int? = nil,
         title: String,
         salary: String?,
         town: String,
         company: String,
         experience: String,
         publishedDate: String,
         likeAction: @escaping () -> Void) {
        self.id = id
        self.isFavourite = isFavourite
        self.lookingNumber = lookingNumber
        self.title = title
        self.salary = salary
        self.town = town
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.likeAction = likeAction
    }
}
