//
//  RecipeFile.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import Foundation

struct RecipeFile: Identifiable {
    var id: String
    var title: String
    var url: String
    var creationDate: Date?
}

struct RecipeFileDecoder: Decodable {
    var studentUploadReadingDTOS: [FileDecoder]
    
    struct FileDecoder: Decodable {
        var idExterne: String
        var url: String
        var tag1: String?
        var tag2: String?
        var tag3: String?
    }
}
