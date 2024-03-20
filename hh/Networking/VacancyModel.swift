//
//  VacancyModel.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import Foundation

// MARK: - Vacancies

struct Vacancies: Codable {
    let vacancies: [Vacancy]
}

// MARK: - Vacancy

struct Vacancy: Codable, Hashable, Identifiable {
    var id = UUID()
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
    
    static func == (lhs: Vacancy, rhs: Vacancy) -> Bool {
        lhs.id == rhs.id &&
        lhs.lookingNumber == rhs.lookingNumber &&
        lhs.title == rhs.title &&
        lhs.address == rhs.address &&
        lhs.company == rhs.company &&
        lhs.experience == rhs.experience &&
        lhs.publishedDate == rhs.publishedDate &&
        lhs.isFavorite == rhs.isFavorite &&
        lhs.salary == rhs.salary &&
        lhs.schedules == rhs.schedules &&
        lhs.appliedNumber == rhs.appliedNumber &&
        lhs.description == rhs.description &&
        lhs.responsibilities == rhs.responsibilities &&
        lhs.questions == rhs.questions
    }
}

// MARK: - Address

struct Address: Codable, Hashable {
    let town, street, house: String
    
    static func == (lhs: Address, rhs: Address) -> Bool {
        lhs.town == rhs.town &&
        lhs.street == rhs.street &&
        lhs.house == rhs.house
    }
}

// MARK: - Experience

struct Experience: Codable, Hashable {
    let previewText, text: String
    
    static func == (lhs: Experience, rhs: Experience) -> Bool {
        lhs.previewText == rhs.previewText &&
        lhs.text == rhs.text
    }
}

// MARK: - Salary

struct Salary: Codable, Hashable {
    let full: String
    let short: String?
    
    static func == (lhs: Salary, rhs: Salary) -> Bool {
        lhs.full == rhs.full &&
        lhs.short == rhs.short
    }
}
