//
//  NavBar.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Навигейшн бар модуля описания вакансии
struct NavBar: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 16
        static let imageSizeS: CGFloat = 24
        static let imageSizeM: CGFloat = 28
    }
    
    // MARK: - Properties
    
    private var isFavourite: Bool
    private let backAction: () -> Void
    private let likeAction: () -> Void
    
    // MARK: - Initializers
    
    init(isFavourite: Bool,
         backAction: @escaping () -> Void,
         likeAction: @escaping () -> Void) {
        self.isFavourite = isFavourite
        self.backAction = backAction
        self.likeAction = likeAction
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            Button(action: backAction) {
                Image("left")
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: Constants.spacing) {
                
                Button(action: {}) {
                    Image("navEye")
                        .resizable()
                        .frame(width: Constants.imageSizeM,
                               height: Constants.imageSizeM)
                }
                
                Button(action: {}) {
                    Image("share")
                        .resizable()
                        .frame(width: Constants.imageSizeS,
                               height: Constants.imageSizeS)
                }
                
                Button(action: likeAction) {
                    Image(isFavourite ? "heartActive" : "heart")
                        .resizable()
                        .frame(width: Constants.imageSizeS,
                               height: Constants.imageSizeS)
                }
            }
        }
    }
}
