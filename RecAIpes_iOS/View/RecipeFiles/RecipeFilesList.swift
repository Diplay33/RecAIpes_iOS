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
                RecipeFilesCell(file: file)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Rechercher par titre, ingrédient..."))
    }
}

#Preview {
    RecipeFilesList(recipeFiles: .constant([
        RecipeFile(id: "1", title: "Pizza reine", url: "", creationDate: Date()),
        RecipeFile(id: "2", title: "Lasagnes à la bolognaise", url: ""),
        RecipeFile(id: "3", title: "Tataki de thon à la sauce soja", url: "", creationDate: Date())
    ]))
}
