//
//  MemberRow.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI
import SwiftData


struct MemberRow: View {
    var member: Member
    @Environment(\.modelContext) private var context
    @Environment(ModelData.self) var modelData
    @Query private var favoriteMembers: [FavoriteMember]


    var body: some View {
        HStack {
            member.image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(member.first + " " + member.last)

            Spacer()

            if modelData.isFavorite(member: member, favoriteMembers: favoriteMembers) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
    

}


#Preview {
    let members = ModelData().members
    return Group {
        MemberRow(member: members[0])
        MemberRow(member: members[1])

    }
    
}
