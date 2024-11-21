//
//  CategoryItem.swift
//  Parliament
//
//  Created by Andrii Deshko on 11.11.2024.
//

import SwiftUI

struct CategoryItem: View {
    var member: Member
    
    var body: some View {
            VStack(alignment: .leading) {
                member.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(20)
                Text("\(member.first) \(member.last)")
                    .foregroundStyle(.primary)
                    .font(.caption)
            }
            .padding(.leading, 15)
        }
}

#Preview {
    CategoryItem(member: ModelData().members[0])
}
