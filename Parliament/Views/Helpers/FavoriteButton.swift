//
//  FavoriteButton.swift
//  Parliament
//
//  Created by Andrii Deshko on 11.11.2024.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    @State private var isActive: Bool = false // Local state to manage immediate updates

    var body: some View {
        Button {
            isSet.toggle()
            isActive = isSet // Update local state for immediate UI feedback
        } label: {
            Label("Toggle Favorite", systemImage: isActive ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isActive ? .yellow : .gray)
        }
        .onAppear {
            isActive = isSet // Synchronize local state with the binding on appear
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
