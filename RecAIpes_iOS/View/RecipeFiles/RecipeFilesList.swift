//
//  RecipeFilesList.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import SwiftUI

struct RecipeFilesList: View {
    @State var searchText: String = ""
    
    @Binding var recipeFiles: [RecipeFile]
    
    var body: some View {
        ScrollView {
            ForEach(searchText.isEmpty ? recipeFiles : recipeFiles.filter { $0.title.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).folding(options: .diacriticInsensitive, locale: .current).contains(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).folding(options: .diacriticInsensitive, locale: .current)) }) { file in
                RecipeFilesCell(file: file)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Rechercher par titre, ingrédient..."))
        .refreshable {
            RecipeFiles.getAllRecipeFiles {
                self.recipeFiles = $0
            }
        }
    }
}

#Preview {
    RecipeFilesList(recipeFiles: .constant([
        RecipeFile(id: "1", title: "Pizza reine", url: "", creationDate: Date()),
        RecipeFile(id: "2", title: "Lasagnes à la bolognaise", url: ""),
        RecipeFile(id: "3", title: "Tataki de thon à la sauce soja", url: "", creationDate: Date())
    ]))
}
