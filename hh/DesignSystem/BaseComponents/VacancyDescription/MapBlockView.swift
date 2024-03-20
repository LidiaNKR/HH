//
//  MapBlockView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Вью с названием и местоположением компании
struct MapBlockView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let height: CGFloat = 134
        static let spacing: CGFloat = 8
        static let imageSize: CGFloat = 16
    }

    // MARK: - Properties
    
    private let company: String
    private let address: String

    // MARK: - Initializers
    
    init(company: String,
         address: String) {
        self.company = company
        self.address = address
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacing) {
            
            HStack(alignment: .center, spacing: Constants.spacing) {
                
                Text(company)
                    .font(Theme.typeface(.title3))
                
                Image("checkMark")
                    .frame(width: Constants.imageSize,
                           height: Constants.imageSize)
            }
            
            Image("map")
                .resizable()
                .cornerRadius(Constants.cornerRadius)
            
            Text(address)
                .font(Theme.typeface(.text1))
        }
               .frame(height: Constants.height)
               .padding(.vertical, 12)
               .padding(.horizontal)
               .foregroundColor(Theme.color(.basic(.white)))
               .background(Theme.color(.basic(.grey1)))
               .cornerRadius(Constants.cornerRadius)
    }
}
