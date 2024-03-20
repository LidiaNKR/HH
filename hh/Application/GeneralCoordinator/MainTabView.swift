//
//  MainTabView.swift
//  hh
//
//  Created by Лидия Некрасова on 14.03.2024.
//

import SwiftUI

///Основной таб бар
struct MainTabView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    @ObservedObject private var dataManager: DataManager
    
    // MARK: - Initializers
    
    init() {
        self.dataManager = DataManager.shared
    }
    
    // MARK: - Body
    
    var body: some View {
        TabView() {
            getContentView(for: .vacancies) {
                NavigationView {
                    VacanciesCoordinatorView(
                        coordinator: coordinator.viewModel(for: .vacanciesCoordinator)
                    )
                }
                .overlay(Theme.color(.basic(.grey1)).frame(height: 1), alignment: .bottom)
                .navigationViewStyle(.stack)
            }
            getContentView(for: .favorites) {
                NavigationView {
                    FavoritesCoordinatorView(
                        coordinator: coordinator.viewModel(for: .favoritesCoordinator)
                    )
                }
                .navigationViewStyle(.stack)
            }
            getContentView(for: .responses) {
                ResponsesView()
            }
            getContentView(for: .messages) {
                MessagesView()
            }
            getContentView(for: .profile) {
                ProfileView()
            }
        }
    }
    
    // MARK: - ViewBuilder
    
    @ViewBuilder
    func getContentView(for type: TabViewItemType, contentView: () -> some View) -> some View {
        if !coordinator.isRegistrationCompleted {
            NavigationView {
                RegistrationCoordinatorView(
                    coordinator: coordinator.viewModel(for: .loginCoordinator)
                )
            }
            .overlay(Theme.color(.basic(.grey1)).frame(height: 1), alignment: .bottom)
            .tabItem {
                TabViewItem(type: type)
            }
            .navigationViewStyle(.stack)
        } else {
            contentView()
                .tabItem { TabViewItem(type: type) }
                .badge(type == .favorites ? dataManager.favoriteVacanciesCount : .zero)
        }
    }
}
