//
//  TabViewItem.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Тип вью таба
enum TabViewItemType: LocalizedStringKey {
    case vacancies  = "app.tab.vacancies"
    case favorites  = "app.tab.favorites"
    case responses  = "app.tab.responses"
    case messages   = "app.tab.messages"
    case profile    = "app.tab.profile"
    
    var image: Image {
        switch self {
        case .vacancies:
            return Image("search")
        case .favorites:
            return Image("favorites")
        case .responses:
            return Image("responses")
        case .messages:
            return Image("messages")
        case .profile:
            return Image("profile")
        }
    }
    
    var text: Text {
        Text(self.rawValue)
    }
}

///Вью таба
struct TabViewItem: View {
    
    // MARK: - Properties
    
    private let type: TabViewItemType
    
    // MARK: - Initializers
    
    init(type: TabViewItemType) {
        self.type = type
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            type.image.renderingMode(.template)
            type.text
        }
    }
}
