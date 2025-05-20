//
//  RecipeIngredientCell.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeIngredientCell: View {
    var ingredient: String
    
    var body: some View {
        VStack(spacing: 0) {
            if let quantity = getIngredientQuantity(ingredient) {
                Text(quantity)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.accentColor)
            }
            
            Text(getIngredientBody(ingredient))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(minHeight: 30)
        .padding(.vertical, 5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
        .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
    }
    
    private func decomposeIngredient(_ ingredient: String) -> [String] {
        return ingredient.split(separator: " ").map(String.init)
    }
    
    private func getIngredientQuantity(_ ingredient: String) -> String? {
        guard decomposeIngredient(ingredient).count > 1 else { return nil }
        guard let firstElement = decomposeIngredient(ingredient).first else { return nil }
        return firstElement.containsDigit() ? firstElement : nil
    }
    
    private func getIngredientBody(_ ingredient: String) -> String {
        guard decomposeIngredient(ingredient).count > 1 else { return ingredient }
        guard let firstElement = decomposeIngredient(ingredient).first else { return ingredient }
        let decomposedIngredients = decomposeIngredient(ingredient)
        return (firstElement.containsDigit() ? decomposedIngredients.filter { $0 != decomposedIngredients.first }.reduce(into: "", { $0 += $1 + " " }) : ingredient).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    RecipeIngredientCell(ingredient: "100g de farine")
}
