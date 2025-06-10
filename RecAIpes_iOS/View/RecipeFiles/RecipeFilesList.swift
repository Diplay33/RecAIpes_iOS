//
//  RecipeFilesList.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import SwiftUI

struct RecipeFilesList: View {
    @State var searchText: String = ""
    @State var searchResults: [RecipeFile] = []
    
    @Binding var recipeFiles: [RecipeFile]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && searchResults.isEmpty {
                    ZStack {
                        Text("Aucune recette trouvée...")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .shadow(color: Color.white.opacity(0.6), radius: 5, x: -4, y: -4)
                    .shadow(color: Color(red: 0.6, green: 0.7, blue: 0.6).opacity(0.25), radius: 6, x: 4, y: 4)
                }
                else {
                    Text(searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Liste des recettes générées" : "Résultats pour \"\(searchText.trimmingCharacters(in: .whitespacesAndNewlines))\"")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? recipeFiles : searchResults) { file in
                        RecipeFilesCell(file: file)
                    }                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Rechercher par titre, ingrédient..."))
        .refreshable {
            RecipeFiles.getAllRecipeFiles {
                self.recipeFiles = $0
            }
        }
        .onChange(of: searchText) {
            self.searchResults = recipeFiles.filter { $0.title.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).folding(options: .diacriticInsensitive, locale: .current).contains(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).folding(options: .diacriticInsensitive, locale: .current)) }
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
