//
//  RegistrationCoordinatorView.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import SwiftUI

///Координатор модуля регистрации
struct RegistrationCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: RegistrationCoordinator
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            LoginView(viewModel: coordinator.viewModel(for: .login))
            LazyNavigationLink(
                isActive: coordinator.isActive(.enteringCode),
                destination: {
                    CodeValidationView(viewModel: coordinator.viewModel(for: .enteringCode))
                }
            )
        }
    }
}
