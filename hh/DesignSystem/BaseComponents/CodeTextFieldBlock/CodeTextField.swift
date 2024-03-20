//
//  CodeTextFieldBlock.swift
//  hh
//
//  Created by Лидия Некрасова on 16.03.2024.
//

import SwiftUI

///Ячейки для ввода кода СМС
struct CodeTextFieldBlock: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 10
        static let cornerRadius: CGFloat = 8
        static let textFieldSize: CGFloat = 48
    }
    
    // MARK: - Properties
    
    @FocusState private var fieldFocus: Int?
    @State var enterValue: [String]
    @State var oldValue = ""
    private let numberOfFields: Int
    private let lastDigitEntered: (Bool) -> Void
    
    // MARK: - Initializers
    
    init(numberOfFields: Int,
         lastDigitEntered: @escaping (Bool) -> Void) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
        self.lastDigitEntered = lastDigitEntered
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(.zero..<numberOfFields, id: \.self) { index in
                TextField("*", text: $enterValue[index],
                          onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                .keyboardType(.numberPad)
                .frame(width: Constants.textFieldSize,
                       height: Constants.textFieldSize)
                .background(Theme.color(.basic(.grey2)))
                .foregroundColor(Theme.color(.basic(.white)))
                .font(Theme.typeface(.title1))
                .cornerRadius(Constants.cornerRadius)
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enterValue[index]) { newValue in
                    if !newValue.isEmpty {
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        // MARK: - Move to Next
                        
                        if index == numberOfFields-1 {
                            ///Cкрытие клавиатуры, при вооде последнего символа
                            fieldFocus = nil
                            lastDigitEntered(true)
                        } else {
                            fieldFocus = (fieldFocus ?? .zero) + 1
                        }
                    } else {
                        
                        // MARK: - Move back
                        
                        fieldFocus = (fieldFocus ?? .zero) - 1
                        lastDigitEntered(false)
                    }
                }
            }
        }
    }
}
