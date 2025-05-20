//
//  RecipeIngredientsView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeIngredientsView: View {
    let idleIngredients: String = """
       - 2 Homards vivants de 500 g chacun
       - 150g de champignons
       - 100g de beurre
       - 3 cuillères à soupe de cognac
       - 3 cuillères à soupe de vin blanc sec
       - 2 jaunes d'œufs
       - 3 cuillères à soupe de crème fraîche
       - Sel et poivre du moulin
       - 100g de gruyère râpé
    """
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Ingrédients")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            VStack(spacing: 10) {
                let ingredientList = decomposeIngredients(idleIngredients)
                
                ForEach(Array(ingredientList.enumerated()), id: \.element) { (index, ingredient) in
                    if(index % 2 == 0) {
                        HStack(spacing: 15) {
                            ForEach(0..<2) { column in
                                let currentIndex = index + column
                                
                                if(currentIndex < ingredientList.count) {
                                    RecipeIngredientCell(ingredient: ingredientList[currentIndex])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func decomposeIngredients(_ paragraph: String) -> [String] {
        let rawIngredients = paragraph.split(separator: "\n")
        let ingredients = rawIngredients.map { String($0.replacingOccurrences(of: "-", with: "").trimmingCharacters(in: .whitespacesAndNewlines)) }
        return ingredients
    }
}

#Preview {
    RecipeIngredientsView()
}
