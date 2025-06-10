//
//  RecipeFilesList.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import SwiftUI

struct RecipeFilesList: View {
    @Binding var recipeFiles: [RecipeFile]
    
    var body: some View {
        ScrollView {
            ForEach(recipeFiles) { file in
                HStack {
                    Image(systemName: "externaldrive.badge.questionmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text(file.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .lineLimit(2)

                        Text("Créé le 23/05/2025 à 14:32")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
                .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
                .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Rechercher par titre, ingrédient..."))
    }
}

#Preview {
    RecipeFilesList(recipeFiles: .constant([
        RecipeFile(id: "1", title: "Pizza reine", url: ""),
        RecipeFile(id: "2", title: "Lasagnes à la bolognaise", url: ""),
        RecipeFile(id: "3", title: "Tataki de thon à la sauce soja", url: "")
    ]))
}
