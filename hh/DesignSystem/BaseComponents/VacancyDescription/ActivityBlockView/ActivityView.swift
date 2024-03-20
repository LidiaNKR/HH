//
//  ActivityView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Вью активности
struct ActivityView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 8
        static let cornerRadius: CGFloat = 8
        static let imageSize: CGFloat = 16
        static let height: CGFloat = 50
        static let textWidth: CGFloat = 107
        static let trailingPadding: CGFloat = 21
    }
    
    // MARK: - Properties
    
    private let viewModel: ActivityViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ActivityViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .top) {
            
            if let text = viewModel.text {
                Text(text)
                    .frame(width: Constants.textWidth)
                    .padding(.trailing, Constants.trailingPadding)
            }
            
            Image(viewModel.icon)
                .frame(width: Constants.imageSize,
                       height: Constants.imageSize)
        }
        .padding(.all, Constants.spacing)
        .font(Theme.typeface(.text1))
        .foregroundColor(Theme.color(.basic(.white)))
        .background(Theme.color(.special(.darkGreen)))
        .cornerRadius(Constants.cornerRadius)
    }
}
