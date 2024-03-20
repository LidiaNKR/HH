//
//  MainButtonStyle.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Стиль конфигурации кнопок
struct MainButtonStyle: ButtonStyle {
    
    ///Типы стиля кнопки
    enum Style {
        case plain
        case filled(color: ColorType, cornerRadius: Double)
    }
    
    // MARK: - Properties
    
    private var enabled: Bool
    private let style: Style
    private let height: Double
    private let font: FontType
    
    // MARK: - Initializers
    
    init(enabled: Bool = true, style: Style = .plain, height: Double, font: FontType) {
        self.enabled = enabled
        self.style = style
        self.height = height
        self.font = font
    }
    
    // MARK: - Methods
    
    func makeBody(configuration: Configuration) -> some View {
        let foreground: Color
        let background: Color
        let radius: Double
        
        switch style {
        case .plain:
            foreground = Theme.color(.special(.blue))
            background = .clear
            radius = .zero
        case .filled(let color, let cornerRadius):
            foreground = enabled ? Theme.color(.basic(.white)) : Theme.color(.basic(.grey4))
            background = enabled ? Theme.color(color) : Theme.color(.special(.darkBlue))
            radius = cornerRadius
        }
        
        return configuration.label
            .frame(maxWidth: .infinity, minHeight: height)
            .font(Theme.typeface(font))
            .foregroundColor(foreground)
            .background(background)
            .cornerRadius(radius)
    }
}
