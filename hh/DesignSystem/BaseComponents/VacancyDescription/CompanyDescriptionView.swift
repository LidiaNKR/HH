//
//  CompanyDescriptionView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Вью с описанием компании
struct CompanyDescriptionView: View {

    // MARK: - Properties
    
    private let text: String

    // MARK: - Initializers
    
    init(text: String) {
        self.text = text
    }
    
    // MARK: - Body
    
    var body: some View {
        Text(text)
            .font(Theme.typeface(.text1))
            .foregroundColor(Theme.color(.basic(.white)))
    }
}
