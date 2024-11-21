//
//  MemberDetail.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI
import SwiftData


import SwiftUI
import SwiftData

struct MemberDetail: View {
    @Environment(\.modelContext) private var context
// Access ModelContext
    @Environment(ModelData.self) var modelData // Access ModelData from environment
    var member: Member

    var body: some View {
        let currentYear = Calendar.current.component(.year, from: Date())
        let age = currentYear - member.bornYear

        VStack {
            CircleImage(image: member.image)
                .padding(.bottom, 50)

            VStack(alignment: .leading) {
                HStack {
                    Text("\(member.first) \(member.last) (\(age))")
                        .font(.title)

                    Spacer()

                    if let twitterURL = URL(string: member.twitter), !member.twitter.isEmpty {
                        Link("Twitter", destination: twitterURL)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
            }

            HStack {
                Text(member.fullPartyName)
                    .font(.subheadline)
                Spacer()
                if member.minister {
                    Text("Minister")
                        .font(.subheadline)
                }
            }
            Divider()
            HStack {
                Text("Constituency: " + member.constituency)
                Spacer()
                FavoriteButton(isSet: Binding(
                    get: { modelData.isFavorite(member: member, context: context) },
                    set: { newValue in
                        if newValue {
                            modelData.addToFavorites(member, context: context)
                        } else {
                            modelData.removeFromFavorites(member, context: context)
                        }
                        do {
                            try context.save() // Persist the changes
                        } catch {
                            print("Failed to save context: \(error)")
                        }
                    }
                ))
            }
        }
        .padding()
        .onAppear {
            do {
                print("ModelContext: \(context)")
                print("ModelData members count: \(modelData.members.count)")
                let fetchDescriptor = FetchDescriptor<FavoriteMember>()
                let favorites = try context.fetch(fetchDescriptor)
                print("Favorite Members: \(favorites)")
            } catch {
                print("Failed to fetch favorites: \(error)")
            }
        }


    }
    
}




#Preview {
    let modelData = ModelData()
    MemberDetail(member: modelData.members[0])
        .environment(modelData)
}
