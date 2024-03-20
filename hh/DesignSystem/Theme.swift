//
//  Theme.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import SwiftUI

final class Theme {
    
    static var typeface: (FontType) -> Font = {
        switch $0 {
        case .title1:
            return .custom(SFProDisplayFont.semiBold.rawValue, size: 22).weight(.semibold)
        case .title2:
            return .custom(SFProDisplayFont.semiBold.rawValue, size: 20).weight(.semibold)
        case .title3:
            return .custom(SFProDisplayFont.medium.rawValue, size: 16).weight(.medium)
        case .title4:
            return .custom(SFProDisplayFont.medium.rawValue, size: 14).weight(.medium)
        case .text1:
            return .custom(SFProDisplayFont.regular.rawValue, size: 14).weight(.regular)
        case .buttonText1:
            return .custom(SFProDisplayFont.semiBold.rawValue, size: 16).weight(.semibold)
        case .buttonText2:
            return .custom(SFProDisplayFont.regular.rawValue, size: 14).weight(.regular)
        case .tabText:
            return .custom(SFProDisplayFont.regular.rawValue, size: 10).weight(.regular)
        case .number:
            return .custom(SFProDisplayFont.regular.rawValue, size: 7).weight(.regular)
        }
    }
    
    static var color: (ColorType) -> Color = {
        switch $0 {
        case .basic(let color):
            switch color {
            case .black:
                return .init(hex: "#000000")
            case .grey1:
                return .init(hex: "#222325")
            case .grey2:
                return .init(hex: "#313234")
            case .grey3:
                return .init(hex: "#858688")
            case .grey4:
                return .init(hex: "#9F9F9F")
            case .grey5:
                return .init(hex: "#DBDBDB")
            case .white:
                return .init(hex: "#FFFFFF")
            }
        case .special(let color):
            switch color {
            case .blue:
                return .init(hex: "#2B7EFE")
            case .darkBlue:
                return .init(hex: "#01427D")
            case .green:
                return .init(hex: "#4CB24E")
            case .darkGreen:
                return .init(hex: "#015905")
            case .red:
                return .init(hex: "#FF0000")
            }
        case .shadow(let color):
            switch color {
            case .shadows:
                return .init(hex: "#0C0C0C")
                    .opacity(0.9)
            }
        }
    }
}
