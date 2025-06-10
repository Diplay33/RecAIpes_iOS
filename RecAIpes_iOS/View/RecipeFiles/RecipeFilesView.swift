//
//  RecipeFilesView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import SwiftUI

struct RecipeFilesView: View {
    @State var recipeFiles: [RecipeFile] = []
    @State var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                if recipeFiles.isEmpty {
                    ZStack {
                        if isLoading {
                            ProgressView("Chargement des données en cours...")
                                .controlSize(.large)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                        }
                        else {
                            RecipeFilesEmptyView()
                        }
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
                    RecipeFilesList(recipeFiles: $recipeFiles)
                }
            }
            .background(Color("Background"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0) {
                        Text("Rec")
                        
                        Text("AI")
                            .foregroundStyle(Color.accentColor)
                        
                        Text("pe")
                    }
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                }
            }
            .onAppear {
                RecipeFiles.getAllRecipeFiles {
                    self.recipeFiles = $0
                    self.isLoading = false
                }
            }
        }
    }
}

#Preview {
    RecipeFilesView()
}
