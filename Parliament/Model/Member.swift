//
//  Profile.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import Foundation
import SwiftUI
import SwiftData


struct Member: Hashable, Codable, Identifiable {
    let id: Int
    let seatNumber: Int
    let last: String
    let first: String
    let party: String
    let minister: Bool
    let picture: String
    let bornYear: Int
    let constituency: String
    let twitter: String
    
    enum CodingKeys: String, CodingKey {
        case id = "personNumber"
        case seatNumber
        case first
        case last
        case party
        case minister
        case picture
        case twitter
        case bornYear
        case constituency
    }
    
    //var isFavorite: Bool = false
    var isFeatured: Bool = false
    
    var image: Image {
        Image(party)
    }
    
    var fullPartyName: String {
        Party(rawValue: party)?.fullName() ?? "Unknown Party"
    }
    
    var category: Party? {
        return Party(rawValue: party)
        }
    
    
    
    
}





