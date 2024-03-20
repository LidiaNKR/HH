//
//  ColorType.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import Foundation

enum ColorType: Hashable {
    case basic(Basic)
    case special(Special)
    case shadow(Shadow)
}

enum Basic: String, CaseIterable, Hashable {
    case black
    case grey1
    case grey2
    case grey3
    case grey4
    case grey5
    case white
}

enum Special: String, CaseIterable, Hashable {
    case blue
    case darkBlue
    case green
    case darkGreen
    case red
}

enum Shadow: String, CaseIterable, Hashable {
    case shadows
}
