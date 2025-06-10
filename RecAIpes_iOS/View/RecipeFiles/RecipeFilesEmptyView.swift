//
//  RecipeFilesEmptyView.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import SwiftUI
import Lottie

struct RecipeFilesEmptyView: View {
    var body: some View {
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

#Preview {
    RecipeFilesEmptyView()
}
