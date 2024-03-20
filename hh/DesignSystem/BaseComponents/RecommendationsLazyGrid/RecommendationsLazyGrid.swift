//
//  RecommendationsLazyGrid.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью со списком рекомендаций
struct RecommendationsLazyGrid: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 8
    }
    
    // MARK: - Properties
    
    private var recomendations: [RecomendationViewModel] = []
    private let rows: [GridItem] = [.init(.flexible(),
                                          spacing: .zero)]
    
    // MARK: - Initializers
    
    init(recomenrations: [RecomendationViewModel]) {
        self.recomendations = recomenrations
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal) {
            
            LazyHGrid(rows: rows,
                      spacing: Constants.spacing) {
                Section {
                    
                    ForEach(recomendations,
                            id: \.self) { recomendation in
                        RecommendationView(
                            recomendation:
                                RecomendationViewModel(
                                    icon: recomendation.icon,
                                    title: recomendation.title,
                                    buttonTitle: recomendation.buttonTitle,
                                    buttonColor: recomendation.buttonColor
                                )
                        )
                    }
                }
            }
             .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}
