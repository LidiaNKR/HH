//
//  ActivityBlockView.swift
//  hh
//
//  Created by Лидия Некрасова on 18.03.2024.
//

import SwiftUI

///Блок с вью активностей
struct ActivityBlockView: View {

    // MARK: - Constants
    
    enum Constants {
        static let spacing: CGFloat = 8
    }

    // MARK: - Properties
    
    private let activities: [ActivityViewModel]

    // MARK: - Initializers
    
    init(activities: [ActivityViewModel]) {
        self.activities = activities
    }
    
    // MARK: - Body

    var body: some View {
        HStack(alignment: .center,
               spacing: Constants.spacing) {
            
            ForEach(activities, id: \.self) { activity in
                if let text = activity.text {
                    ActivityView(
                        viewModel: ActivityViewModel(
                            text: text,
                            icon: activity.icon))
                }
            }
        }
    }
}
