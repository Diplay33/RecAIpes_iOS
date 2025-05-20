//
//  SearchRecipeBar.swift
//  RecAIpe
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct SearchRecipeBar: View {
    @Binding var dishTitle: String
    
    var body: some View {
        ZStack {
            TextField(text: $dishTitle) {
                Text("Saisissez l'intitulé d'un plat")
            }
            .padding(.horizontal, 8)
            .frame(height: 55)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
            .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
                
            Button(action: { print("search") }) {
                Text("Rechercher")
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .frame(height: 40)
                    .padding(.horizontal, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.accentColor)
                    )
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchRecipeBar(dishTitle: .constant(""))
}
