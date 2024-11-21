//
//  CircleImage.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(width: 120, height: 120)
           // .shadow(radius: 20)
    }
}

#Preview {
    CircleImage(image: Image("sd"))
}
