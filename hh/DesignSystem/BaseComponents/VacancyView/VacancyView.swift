//
//  VacancyView.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import SwiftUI

///Вью вакансии
struct VacancyView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let spacingXS: CGFloat = 4
        static let spacingS: CGFloat = 8
        static let spacingM: CGFloat = 10
        static let spacingL: CGFloat = 21
        static let imageSize: CGFloat = 16
        static let buttonSize: CGFloat = 24
        static let buttonHeight: CGFloat = 32
        static let buttonCornerRadius: CGFloat = 50
    }
    
    // MARK: - Properties
    
    private var vacancy: VacancyViewModel
    
    // MARK: - Initializers
    
    init(vacancy: VacancyViewModel) {
        self.vacancy = vacancy
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacingL) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: Constants.spacingM) {
                    if let lookingNumber = vacancy.lookingNumber {
                        Text("currentlyViewing".localized
                             + "\(lookingNumber.setDeclention(wordType: .people))")
                            .foregroundColor(Theme.color(.special(.green)))
                    }
                    
                    Text(vacancy.title)
                        .font(Theme.typeface(.title1))
                    
                    if let salary = vacancy.salary {
                        Text(salary)
                            .font(Theme.typeface(.title2))
                    }
                    
                    VStack(alignment: .leading, spacing: Constants.spacingXS) {
                        Text(vacancy.town)
                        
                        HStack() {
                            Text(vacancy.company)
                            
                            Image("checkMark")
                                .resizable()
                                .frame(width: Constants.imageSize,
                                       height: Constants.imageSize)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: Constants.spacingS) {
                        Image("experience")
                            .resizable()
                            .frame(width: Constants.imageSize,
                                   height: Constants.imageSize)
                        
                        Text(vacancy.experience)
                    }
                    
                    Text("published".localized
                         + "\(vacancy.publishedDate.dateFormatter())")
                        .foregroundColor(Theme.color(.basic(.grey3)))
                }
                Spacer()
                
                Button(action: vacancy.likeAction) {
                    Image(vacancy.isFavourite ? "heartActive" : "heart")
                        .resizable()
                        .frame(width: Constants.buttonSize,
                               height: Constants.buttonSize)
                }
            }
            Button("respond".localized) {}
            .buttonStyle(MainButtonStyle(
                style: .filled(color: .special(.green),
                               cornerRadius: Constants.buttonCornerRadius),
                height: Constants.buttonHeight,
                font: .buttonText2))
        }
        .font(Theme.typeface(.text1))
        .foregroundColor(Theme.color(.basic(.white)))
        .padding(.all)
        .background(Theme.color(.basic(.grey1)))
        .cornerRadius(Constants.cornerRadius)
    }
}
