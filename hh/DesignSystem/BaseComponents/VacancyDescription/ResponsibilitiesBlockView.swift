//
//  ResponsibilitiesBlockView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Вью с описанием задач
struct ResponsibilitiesBlockView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 8
    }

    // MARK: - Properties
    
    private let text: String

    // MARK: - Initializers
    
    init(text: String) {
        self.text = text
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            
            Text("tasksTitle".localized)
                .font(Theme.typeface(.title2))
            
            Text(text)
                .font(Theme.typeface(.text1))
        }
        .foregroundColor(Theme.color(.basic(.white)))
    }
}
