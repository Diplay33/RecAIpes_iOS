//
//  RecipeIngredientsView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeIngredientsView: View {
    let idleIngredients: [String] = [
        "160g de lardons fumés",
        "15cl de crème fraîche",
        "poivre",
        "sel",
        "200g de spaghettis",
        "2 jaunes d'œuf",
        "60g de parmesan râpé"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Ingrédients")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            VStack(spacing: 10) {
                ForEach(Array(idleIngredients.enumerated()), id: \.element) { (index, ingredient) in
                    if(index % 2 == 0) {
                        HStack(spacing: 15) {
                            ForEach(0..<2) { column in
                                let currentIndex = index + column
                                if(currentIndex < idleIngredients.count) {
                                    RecipeIngredientCell(ingredient: idleIngredients[currentIndex])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeIngredientsView()
}
