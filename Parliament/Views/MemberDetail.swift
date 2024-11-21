//
//  MemberDetail.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI

struct MemberDetail: View {
    @Environment(ModelData.self) var modelData
    var member: Member
    
    var memberIndex: Int {
        modelData.members.firstIndex(where: { $0.id == member.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
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
                FavoriteButton(isSet: $modelData.members[memberIndex].isFavorite)
            }
            
        }
        .padding()
    }
}

#Preview {
    let modelData = ModelData()
    MemberDetail(member: modelData.members[0])
        .environment(modelData)
}
