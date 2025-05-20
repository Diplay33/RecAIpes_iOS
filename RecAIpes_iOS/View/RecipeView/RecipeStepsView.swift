//
//  RecipeStepsView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeStepsView: View {
    let idleRecipe: String = """
    1. Préchauffez votre four à 210°C (thermostat 7).
    2. Plongez les homards vivants 20 min dans de l'eau bouillante salée. Ensuite, enlevez la
    queue et dégagez la chair.
    3. Dans une poêle, faites sauter les champignons préalablement émincés dans 50 g de
    beurre.
    4. Ajoutez les morceaux de homard dans la poêle avec les champignons, mélangez et
    flambez le tout avec 3 cuillères à soupe de cognac.
    5. Arrosez le mélange de 3 cuillères à soupe de vin blanc sec, réduisez le feu et laissez
    mijoter à feu doux pendant 10 minutes.
    6. Filtrez le contenu de la poêle pour récupérer le jus de cuisson dans une casserole.
    7. Mélangez hors du feu le jus de cuisson avec 2 jaunes d'oeufs et 3 cuillères à soupe de
    crème fraîche. Ajoutez le reste du beurre et remuez bien.
    8. Disposez les carapaces de homard dans un plat à gratin, remplissez-les avec la
    préparation de homard et champignons. Nappez avec la sauce, puis saupoudrez de gruyère
    râpé.
    9. Enfournez pour 10 à 15 min jusqu'à ce que le dessus soit bien doré et gratiné.  
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
            steps.append(stepText.replacingOccurrences(of: "\n", with: " "))
        }
        
        return steps
    }
}

#Preview {
    RecipeStepsView()
}
