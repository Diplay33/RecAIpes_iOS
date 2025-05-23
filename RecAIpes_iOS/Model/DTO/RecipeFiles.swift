//
//  RecipeFiles.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import Foundation

struct RecipeFiles {
    static func getAllRecipeFiles(completion: @escaping ([RecipeFile]) -> ()) {
        RecipeFileDAO.getAllRecipeFiles(completion: completion)
    }
}
