//
//  String.swift
//  hh
//
//  Created by Лидия Некрасова on 17.03.2024.
//

import Foundation

extension String {
    
    ///Возвращает текст с заглавной буквы
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    ///Локализация
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    ///Проверка текста на соотвествие формату email
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@",
                    "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            .evaluate(with: self)
    }
    
    /// Форматирование даты
    /// - Returns: текст в формате “{день}” + “{месяц}”
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            let day = Calendar.current.component(.day, from: date)
            let month = Calendar.current.component(.month, from: date)
            
            var monthName: LocalizedStringResource = ""
            switch month {
            case 1: monthName = "january"
            case 2: monthName = "february"
            case 3: monthName = "march"
            case 4: monthName = "april"
            case 5: monthName = "may"
            case 6: monthName = "june"
            case 7: monthName = "july"
            case 8: monthName = "august"
            case 9: monthName = "september"
            case 10: monthName = "october"
            case 11: monthName = "november"
            case 12: monthName = "december"
            default: break
            }
            
            return "\(day) \(String(localized:monthName))"
        }
        return ""
    }
}
