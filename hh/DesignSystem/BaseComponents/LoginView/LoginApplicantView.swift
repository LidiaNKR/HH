//
//  LoginApplicantView.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Вью входа соискателя
struct LoginApplicantView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacingM: CGFloat = 16
        static let spacingS: CGFloat = 8
        static let imageSizeS: CGFloat = 13
        static let imageSizeM: CGFloat = 24
        static let buttonSize: CGFloat = 28
        static let cornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 3
        static let borderLineWidth: CGFloat = 1
        static let height: CGFloat = 40
        static let verticalPadding: CGFloat = 24
    }
    
    // MARK: - Properties
    
    @State private var textEmail: String = ""
    @State private var isEmailValid: Bool = true
    private let continueDidTap: ((String) -> Void)
    
    // MARK: - Initializers
    
    init(continueDidTap: @escaping (String) -> Void) {
        self.continueDidTap = continueDidTap
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacingM) {
            
            Text("loginApplicantTitle".localized)
                .font(Theme.typeface(.title3))
            
            HStack(spacing: Constants.spacingS) {
                
                if textEmail.isEmpty {
                    Image("responses")
                        .resizable()
                        .frame(width: Constants.imageSizeM,
                               height: Constants.imageSizeM)
                }
                
                TextField("loginApplicantPlaceholder".localized, text: $textEmail)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .font(Theme.typeface(.text1))
                    .onChange(of: textEmail) { isEdit in
                        isEmailValid = true
                    }
                Spacer()
                
                if !textEmail.isEmpty {
                    Button(action: {
                        textEmail = ""
                        isEmailValid = true
                    }) {
                        Image("cross")
                            .frame(width: Constants.imageSizeS,
                                   height: Constants.imageSizeS)
                    }
                    .frame(width: Constants.buttonSize,
                           height: Constants.buttonSize)
                }
            }
            .padding(.all, Constants.spacingS)
            .background(Theme.color(.basic(.grey2)))
            .frame(height: Constants.height)
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: Theme.color(.shadow(.shadows)),
                    radius: Constants.shadowRadius,
                    x: .zero,
                    y: Constants.shadowRadius)
            .overlay(alignment: .trailing) {
                if !isEmailValid {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .stroke(Theme.color(.special(.red)), lineWidth: Constants.borderLineWidth)
                }
            }
            
            if !isEmailValid {
                Text("notValidEmail".localized)
                    .font(.callout)
                    .foregroundColor(Theme.color(.special(.red)))
                    .padding(.top, Constants.spacingS)
            }
            
            HStack {
                Button("continue".localized) {
                    if textEmail.isValidEmail{
                        continueDidTap(textEmail)
                    } else {
                        isEmailValid = false
                    }
                }
                .buttonStyle(MainButtonStyle(
                    enabled: !textEmail.isEmpty,
                    style: .filled(color: .special(.blue),
                                   cornerRadius: Constants.cornerRadius),
                    height: Constants.height,
                    font: .buttonText2))
                
                Button("loginApplicantButtonTitle".localized) {}
                .buttonStyle(MainButtonStyle(height: Constants.height,
                                             font: .buttonText2))
            }
        }
        .foregroundColor(Theme.color(.basic(.white)))
        .padding(.horizontal)
        .padding(.vertical, Constants.verticalPadding)
        .background(Theme.color(.basic(.grey1)))
        .cornerRadius(Constants.cornerRadius)
    }
}
