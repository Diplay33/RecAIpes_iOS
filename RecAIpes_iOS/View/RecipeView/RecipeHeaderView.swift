//
//  RecipeHeaderView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {            
            Text("Spaghettis à la Carbonara")
                .font(.title2)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

#Preview {
    RecipeHeaderView()
}
