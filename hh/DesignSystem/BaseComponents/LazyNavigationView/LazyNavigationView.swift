//
//  LazyNavigationView.swift
//  hh
//
//  Created by Лидия Некрасова on 17.03.2024.
//

import SwiftUI

struct LazyNavigationLink<Destination>: View where Destination: View {
    let isActive: Binding<Bool>
    @ViewBuilder let destination: () -> Destination
    
    var body: some View {
        NavigationLink(
            isActive: isActive,
            destination: {
                LazyLoadView(destination())
            },
            label: {
                EmptyView()
            })
    }
}
