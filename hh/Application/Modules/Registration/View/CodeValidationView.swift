//
//  CodeValidationView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

/// Вью модуля ввода СМС-пароля
struct CodeValidationView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let spacing: CGFloat = 16
        static let numberOfFields: Int = 4
        static let leadingPadding: CGFloat = 12
        static let trailingPadding: CGFloat = 18
        static let buttonHeight: CGFloat = 48
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: CodeValidationViewModel
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacing) {
            
            Text("сodeValidationTitle".localized
                 + viewModel.email)
            .font(Theme.typeface(.title2))
            
            Text("сodeValidationText".localized)
                .font(Theme.typeface(.title3))
            
            CodeTextFieldBlock(numberOfFields: Constants.numberOfFields) { isLastDigitEntered in
                viewModel.updateValue(newValue: isLastDigitEntered)
            }
            
            Button("сodeValidationButtonTitle".localized) {
                viewModel.confirmButtonTapped()
            }
            .buttonStyle(MainButtonStyle(
                enabled: viewModel.isValidPassword,
                style: .filled(color: .special(.blue),
                               cornerRadius: Constants.cornerRadius),
                height: Constants.buttonHeight,
                font: .buttonText1))
        }
        .foregroundColor(Theme.color(.basic(.white)))
        .padding(.leading, Constants.leadingPadding)
        .padding(.trailing, Constants.trailingPadding)
        .navigationBarBackButtonHidden()
    }
}
