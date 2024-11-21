//
//  MemberList.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI
import SwiftData


struct MemberList: View {
    @Environment(\.modelContext) private var context
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @Query private var favoriteMembers: [FavoriteMember] // Observe favorite members
    
    var filteredMembers: [Member] {
        modelData.members.filter { member in
            (!showFavoritesOnly || modelData.isFavorite(member: member, context: context))
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredMembers) { member in
                    NavigationLink {
                        MemberDetail(member: member)
                    } label: {
                        MemberRow(member: member)
                    }
                }
            }
            .navigationTitle("Parliament Members")
            .animation(.default, value: favoriteMembers.count) // Trigger list animation on favorite change

        } detail: {
            Text("Select a member")
        }
    }
    
}


#Preview {
    MemberList()
        .environment(ModelData())
}

