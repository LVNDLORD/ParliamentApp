//
//  CategoryHome.swift
//  Parliament
//
//  Created by Andrii Deshko on 11.11.2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
         
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    key in CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("MPs by Party")
        } detail: {
            Text("Select a Member")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
