//
//  RecipeFileDAO.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 23/05/2025.
//

import Foundation

let BASE_URL = "http://141.94.115.201/"

struct RecipeFileDAO {
    static func getAllRecipeFiles(completion: @escaping ([RecipeFile]) -> () ) {
        guard let url = URL(string: BASE_URL + "public/search/6") else {
            completion([])
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let error = err {
                completion([])
                print(error)
                return
            }
            
            guard let data else {
                completion([])
                return
            }
            
            do {
                let recipeFile = try JSONDecoder().decode(RecipeFileDecoder.self, from: data)
                completion(recipeFile.studentUploadReadingDTOS.map { RecipeFile(id: $0.idExterne, url: $0.url) })
            } catch {
                completion([])
            }
        }
        task.resume()
    }
}
