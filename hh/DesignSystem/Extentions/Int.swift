//
//  Int.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import Foundation

///Тип склоняемного слова
enum DeclinedWordType {
    case people
    case vacancy
    
    var value: (LocalizedStringResource,
                LocalizedStringResource,
                LocalizedStringResource) {
        switch self {
        case .people:
            return ("person", "persons", "manyPersons")
        case .vacancy:
            return ("vacancy", "vacancies", "manyVacancies")
        }
    }
}

extension Int {
    
    /// Склонение типа слова, в зависимости от количества
    /// - Parameter wordType: Тип склоняемого слова
    /// - Returns: отформатированный текст: “{количество}” + “{тип слова}”
    func setDeclention(wordType: DeclinedWordType) -> String {
        var valueString: LocalizedStringResource = wordType.value.0
        
        if "1".contains("\(self % 10)") { valueString = wordType.value.0 }
        if "234".contains("\(self % 10)") { valueString = wordType.value.1 }
        if "567890".contains("\(self % 10)") { valueString = wordType.value.2 }
        if 11...14 ~= self % 100 { valueString = wordType.value.0 }
        return "\(self) " + String(localized: valueString)
    }
}
