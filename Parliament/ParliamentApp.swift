//
//  ParliamentApp.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI

@main
struct ParliamentApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
