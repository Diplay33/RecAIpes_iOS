//
//  RecipeMainView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeMainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            RecipeHeaderView()
            
            RecipeIngredientsView()
                .frame(maxWidth: .infinity)
            
            RecipeStepsView()
        }
        .padding(.horizontal)
    }
}

#Preview {
    RecipeMainView()
}
