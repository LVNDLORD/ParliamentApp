//
//  MemberList.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI

struct MemberList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredMembers: [Member] {
        modelData.members.filter {member in
            (!showFavoritesOnly || member.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {Toggle(isOn: $showFavoritesOnly) {
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
            //     .animation(.default, value: filteredMembers)
            .navigationTitle("Parliament Members")
        } detail: {
            Text("Select a member")
        }
    }
}
#Preview {
    MemberList()
        .environment(ModelData())
}

