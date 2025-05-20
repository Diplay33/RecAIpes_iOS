//
//  MainView.swift
//  RecAIpe
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct MainView: View {
    @State var dishTitle: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                    .frame(height: 40)
                
                SearchRecipeBar(dishTitle: $dishTitle)
                
                Spacer()
                    .frame(height: 40)
                
                RecipeMainView()
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
        }
    }
}

#Preview {
    MainView()
}
