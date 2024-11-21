//
//  FavouriteMember.swift
//  Parliament
//
//  Created by Andrii Deshko on 15.11.2024.
//

import Foundation
import SwiftData

@Model
class FavoriteMember: Identifiable {
    var id: Int // Use member's id for easy lookup
    var isFavorite: Bool
    
    init(id: Int, isFavorite: Bool = true) {
        self.id = id
        self.isFavorite = isFavorite
    }
    
    
    
}
