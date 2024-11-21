//
//  MemberRow.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI

struct MemberRow: View {
    var member: Member

    var body: some View {
        HStack {
            member.image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(member.first + " " + member.last)

            Spacer()

            if member.isFavorite {
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
