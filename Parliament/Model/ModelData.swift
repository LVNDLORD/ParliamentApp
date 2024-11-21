//
//  ModelData.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//


// fetch data from URL

import Foundation
import SwiftData
import Observation

@Observable
@MainActor // Ensures that all updates are handled on the main thread
class ModelData {
    var members: [Member] = []
    
    var features: [Member] {
        members.filter { $0.isFeatured }
    }
    
    var categories: [String: [Member]] {
        Dictionary(
            grouping: members,
            by: { $0.category?.rawValue ?? "Unknown" }
        )
    }
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
            fatalError("Invalid URL")
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                self.members = try decoder.decode([Member].self, from: data)
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
    // MARK: - Favorite Management

        // Check if a member is a favorite using FetchDescriptor
        func isFavorite(member: Member, context: ModelContext) -> Bool {
            let fetchDescriptor = FetchDescriptor<FavoriteMember>(
                predicate: #Predicate { $0.id == member.id }
            )
            
            if let favorites = try? context.fetch(fetchDescriptor), !favorites.isEmpty {
                return favorites.first?.isFavorite ?? false
            }
            return false
        }

        // Add a member to favorites
        func addToFavorites(_ member: Member, context: ModelContext) {
            let favorite = FavoriteMember(id: member.id, isFavorite: true)
            context.insert(favorite)
        }

        // Remove a member from favorites
        func removeFromFavorites(_ member: Member, context: ModelContext) {
            let fetchDescriptor = FetchDescriptor<FavoriteMember>(
                predicate: #Predicate { $0.id == member.id }
            )
            
            if let favorites = try? context.fetch(fetchDescriptor) {
                for favorite in favorites {
                    context.delete(favorite)
                }
            }
        }

        // Toggle favorite status
        func toggleFavoriteStatus(for member: Member, context: ModelContext) {
            if isFavorite(member: member, context: context) {
                removeFromFavorites(member, context: context)
            } else {
                addToFavorites(member, context: context)
            }
        }
    
    func isFavorite(member: Member, favoriteMembers: [FavoriteMember]) -> Bool {
            favoriteMembers.contains { $0.id == member.id }
        }
    }








// using local JSON

//import Foundation
//
//@Observable
//class ModelData {
//    var members: [Member] = load("mps.json")
//
//    var features: [Member] {
//        members.filter{ $0.isFeatured }
//    }
//
//    var categories: [String: [Member]] {
//        Dictionary(
//            grouping: members,
//            by: { $0.category?.rawValue ?? "Unknown"}
//        )
//    }
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}


