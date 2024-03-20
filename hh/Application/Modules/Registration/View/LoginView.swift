//
//  LoginView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

/// Вью модуля входа
struct LoginView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 18
        static let paddingTop: CGFloat = 32
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LoginViewModel
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: Constants.spacing) {
                LoginApplicantView() { email in
                    viewModel.continueButtonTapped(email: email)
                }
                LoginEmployerView()
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("loginTitle".localized)
                        .foregroundColor(Theme.color(.basic(.white)))
                        .font(Theme.typeface(.title2))
                        .padding(.top, Constants.paddingTop)
                }
            }
        }
    }
}
