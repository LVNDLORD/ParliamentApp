//
//  FavoriteMembers.swift
//  Parliament
//
//  Created by Andrii Deshko on 11.11.2024.
//

// FavoriteMembers.swift
import Foundation
import Combine

struct FavoriteMembers: Observable {
    var favoriteMembers: [Member] = []

    mutating func toggleFavorite(_ member: Member) {
        if let index = favoriteMembers.firstIndex(where: { $0.id == member.id }) {
            favoriteMembers.remove(at: index)
        } else {
            favoriteMembers.append(member)
        }
    }

    func isFavorite(_ member: Member) -> Bool {
        favoriteMembers.contains(where: { $0.id == member.id })
    }
}
