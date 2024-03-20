//
//  SearchBar.swift
//  hh
//
//  Created by Лидия Некрасова on 19.03.2024.
//

import SwiftUI

///Бар поиска ванкансий и фильтр
struct SearchBar: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 8
        static let cornerRadius: CGFloat = 8
        static let imageSize: CGFloat = 24
        static let height: CGFloat = 32
        static let verticalPadding: CGFloat = 24
        static let elementSize: CGFloat = 40
    }
    
    // MARK: - Properties
    
    @State private var text: String = ""
    
    // MARK: - Initializers
    
    var body: some View {
        HStack(spacing: Constants.spacing) {
            
            HStack(spacing: Constants.spacing) {
                
                Image("search")
                    .resizable()
                    .frame(width: Constants.imageSize,
                           height: Constants.imageSize)
                
                TextField("searchPlaceholder".localized, text: $text)
                    .font(Theme.typeface(.text1))
                
                Spacer()
            }
            .padding(.all, Constants.spacing)
            .background(Theme.color(.basic(.grey2)))
            .frame(height: Constants.elementSize)
            .cornerRadius(Constants.cornerRadius)
            
            Button(action: {
                text = ""
            }) {
                Image("filter")
                    .frame(width: Constants.imageSize,
                           height: Constants.imageSize)
            }
            .frame(width: Constants.elementSize,
                   height: Constants.elementSize)
            .background(Theme.color(.basic(.grey2)))
            .cornerRadius(Constants.cornerRadius)
        }
    }
}
