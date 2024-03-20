//
//  RecommendationView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью рекомендаций
struct RecommendationView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let width: CGFloat = 132
        static let height: CGFloat = 120
        static let spacing: CGFloat = 16
        static let imageSize: CGFloat = 32
        static let leadingPadding: CGFloat = 8
        static let verticalPadding: CGFloat = 10
        static let trailingPadding: CGFloat = 12
    }
    
    // MARK: - Properties
    
    private let recomendation: RecomendationViewModel
    
    // MARK: - Initializers
    
    init(recomendation: RecomendationViewModel) {
        self.recomendation = recomendation
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            
            Image(recomendation.icon)
                .frame(width: Constants.imageSize,
                       height: Constants.imageSize)
                .background(Theme.color(recomendation.buttonColor))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                
                Text(recomendation.title)
                    .padding(.horizontal, .zero)
                    .font(Theme.typeface(.title4))
                    .foregroundColor(Theme.color(.basic(.white)))
                
                if let buttonTitle = recomendation.buttonTitle {
                    Button(buttonTitle, action: {})
                        .foregroundColor(Theme.color(.special(.green)))
                        .font(Theme.typeface(.buttonText2))
                }
                Spacer(minLength: .zero)
            }
        }
        .padding(EdgeInsets(top: Constants.verticalPadding,
                            leading: Constants.leadingPadding,
                            bottom: Constants.verticalPadding,
                            trailing: Constants.trailingPadding))
        .frame(width: Constants.width,
               height: Constants.height,
               alignment: .leading)
        .background(Theme.color(.basic(.grey1)))
        .cornerRadius(Constants.cornerRadius)
    }
}
