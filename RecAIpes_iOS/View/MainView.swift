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
                SearchRecipeBar(dishTitle: $dishTitle)
                
                Spacer()
                    .frame(height: 50)
                
                RecipeMainView()
            }
            .background(Color("Background"))
            .navigationTitle(Text("RecAIpe"))
        }
    }
}

#Preview {
    MainView()
}
