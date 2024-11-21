//
//  CategoryRow.swift
//  Parliament
//
//  Created by Andrii Deshko on 11.11.2024.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String // partyName
    var items: [Member]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName) // different parties
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { member in
                        NavigationLink {
                            MemberDetail(member: member)
                        } label: {
                            CategoryItem(member: member)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let members = ModelData().members
    CategoryRow(
        categoryName: members[2].category?.rawValue ?? "No category found",
        items: Array(members.prefix(5))
        
    )
    
    
}
