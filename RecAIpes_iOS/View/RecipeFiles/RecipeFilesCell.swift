//
//  RecipeFilesCell.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 10/06/2025.
//

import SwiftUI

struct RecipeFilesCell: View {
    @State var recipeShown: Bool = false
    
    let file: RecipeFile
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var body: some View {
        Button(action: { recipeShown = true }) {
            HStack {
                ZStack {
                    if let thumbnailLink = file.thumbnailUrl, let thumbnailUrl = URL(string: thumbnailLink) {
                        AsyncImage(url: thumbnailUrl) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    }
                    else {
                        Image(systemName: "externaldrive.badge.questionmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading) {
                    Text(file.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .lineLimit(2)
                    
                    ZStack {
                        if let creationDate = file.creationDate as Date? {
                            Text("Créé le \(dayFormatter.string(from: creationDate)) à \(hourFormatter.string(from: creationDate))")
                        }
                        else {
                            Text("Date de création inconnue")
                        }
                    }
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
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $recipeShown) {
            SafariView(url: URL(string: file.url)!)
        }
    }
}

#Preview {
    RecipeFilesCell(file: RecipeFile(id: "1", title: "Pizza reine", url: "", creationDate: Date()))
}
