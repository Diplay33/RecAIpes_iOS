//
//  RecipeStepsView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeStepsView: View {
    let idleRecipe: String = """
    1. Portez à ébullition un faitout d'eau salée. Plongez-y les spaghetti et laissez-les cuire environ 12 min, jusqu'à ce qu'ils soient al dente.
    2. Pendant la cuisson des spaghetti, faites revenir les lardons à sec dans une poêle, jusqu'à ce qu'ils soient bien dorés.
    3. Baissez le feu et incorporez la crème fraîche. Salez légèrement, poivrez généreusement et ajoutez les jaunes d'oeufs, en fouettant pour qu'ils ne cuisent pas.
    4. Rectifiez l'assaisonnement.
    5. Egouttez les pâtes. Versez-les dans la sauteuse, mélangez et transvasez dans un plat de service.
    6. Servez en présentant le parmesan à part.    
    """
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Recette")
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                VStack(spacing: 10) {
                    ForEach(decomposeSteps(idleRecipe), id: \.self) { step in
                        VStack {
                            Text(step)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
                        .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
                    }
                }
            }
        }
    }
    
    private func decomposeSteps(_ paragraph: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: #"(?m)^\s*\d+\.\s"#)
        let nsParagraph = paragraph as NSString
        let matches = regex.matches(in: paragraph, range: NSRange(location: 0, length: nsParagraph.length))

        var steps: [String] = []
        for i in 0..<matches.count {
            let start = matches[i].range.location
            let end: Int
            if i + 1 < matches.count {
                end = matches[i + 1].range.location
            } else {
                end = nsParagraph.length
            }
            
            let stepText = nsParagraph.substring(with: NSRange(location: start, length: end - start)).trimmingCharacters(in: .whitespacesAndNewlines)
            steps.append(stepText)
        }
        
        return steps
    }
}

#Preview {
    RecipeStepsView()
}
