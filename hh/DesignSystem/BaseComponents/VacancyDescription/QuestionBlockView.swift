//
//  QuestionBlockView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Вью с вопросами
struct QuestionBlockView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let cornerRadius: CGFloat = 50
        static let spacing: CGFloat = 8
        static let horisantalPadding: CGFloat = 12
    }

    // MARK: - Properties
    
    private let questions: [String]

    // MARK: - Initializers
    
    init(questions: [String]) {
        self.questions = questions
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacing) {
            
            Text("questionTitle".localized)
            
            Text("questionText".localized)
                .foregroundColor(Theme.color(.basic(.grey3)))
                .padding(.bottom, Constants.spacing)
            
            VStack(alignment: .leading,
                   spacing: Constants.spacing) {
                ForEach(questions, id: \.self) { question in
                    Text(question)
                        .padding(.horizontal, Constants.horisantalPadding)
                        .padding(.vertical, Constants.spacing)
                        .background(Theme.color(.basic(.grey2)))
                        .cornerRadius(Constants.cornerRadius)
                }
            }
        }
        .font(Theme.typeface(.title4))
        .foregroundColor(Theme.color(.basic(.white)))
    }
}

struct QuestionBlockView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBlockView(questions: ["Где распологается место работы?",
                                      "Какой график работы?",
                                      "Вакансия открыта?",
                                      "Какая оплата труда?"])
    }
}
