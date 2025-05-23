//
//  ContentView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI
import Lottie

struct ContentView: View {
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
                            LottieView {
                                try await DotLottieFile
                                    .loadedFrom(url: URL(string: "https://lottie.host/cdd03874-19df-4769-b713-37a3f6efa6b5/lIlrtCJkxb.lottie")!)
                            }
                            .looping()
                            .frame(width: 250, height: 250)
                            .offset(CGSize(width: 0, height: -40))
                            
                            Text("Aucun fichier de recette dans la base de données...")
                                .foregroundStyle(.accent)
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .multilineTextAlignment(.center)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                                .padding(.bottom, 30)
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
                    Text("Recettes")
                    //            ScrollView {
                    //                Text("Hello, World!")
                    //                    .shadow(radius: 5)
                    //            }
                    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //            .searchable(text: .constant(""), prompt: Text("Rechercher par titre, ingrédient..."))
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
    ContentView()
}
