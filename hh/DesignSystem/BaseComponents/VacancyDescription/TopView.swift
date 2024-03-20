//
//  TopView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Верхний блок модуля описания вакансии
struct TopView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacingM: CGFloat = 16
        static let spacingS: CGFloat = 6
    }

    // MARK: - Properties
    
    private let title: String
    private let salary: String
    private let experience: String
    private let schedules:  String

    // MARK: - Initializers
    
    init(title: String,
         salary: String,
         experience: String,
         schedules: String) {
        self.title = title
        self.salary = salary
        self.experience = experience
        self.schedules = schedules
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacingM) {
            
            Text(title)
                .font(Theme.typeface(.title1))
            
            Text(salary)
            
            VStack(alignment: .leading,
                   spacing: Constants.spacingS) {
                
                Text("experience".localized + experience)
                
                Text(schedules)
            }
        }
        .font(Theme.typeface(.text1))
        .foregroundColor(Theme.color(.basic(.white)))
    }
}
