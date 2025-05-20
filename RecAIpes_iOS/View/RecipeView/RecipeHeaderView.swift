//
//  RecipeHeaderView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct RecipeHeaderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {            
            Text("Homards Thermidor à la Française")
                .font(.title2)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            
            Image("Example")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
                .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
        }
    }
}

#Preview {
    RecipeHeaderView()
}
