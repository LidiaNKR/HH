//
//  LoginEmployerView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью входа работодателя
struct LoginEmployerView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacingM: CGFloat = 16
        static let spacingS: CGFloat = 10
        static let cornerRadiusS: CGFloat = 8
        static let cornerRadiusM: CGFloat = 50
        static let height: CGFloat = 32
        static let verticalPadding: CGFloat = 24
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacingM) {
            
            VStack(alignment: .leading,
                   spacing: Constants.spacingS) {
                
                Text("loginEmployerTitle".localized)
                    .font(Theme.typeface(.title3))
                    .foregroundColor(Theme.color(.basic(.white)))
                
                Text("loginEmployerText".localized)
                    .font(Theme.typeface(.text1))
                    .foregroundColor(Theme.color(.basic(.white)))
            }
            
            Button("loginEmployerButtonTitle".localized) {}
            .buttonStyle(MainButtonStyle(
                style: .filled(color: .special(.green),
                               cornerRadius: Constants.cornerRadiusM),
                height: Constants.height,
                font: .buttonText2))
        }
        .padding(.horizontal)
        .padding(.vertical, Constants.verticalPadding)
        .background(Theme.color(.basic(.grey1)))
        .cornerRadius(Constants.cornerRadiusS)
    }
}
