//
//  MainView.swift
//  RecAIpe
//
//  Created by Jacques HU on 20/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchRecipeBar()
            }
            .background(Color("Background"))
            .navigationTitle(Text("RecAIpe"))
        }
    }
}

#Preview {
    MainView()
}
