//
//  String+Extension.swift
//  RecAIpes_iOS
//
//  Created by Jacques HU on 20/05/2025.
//

import Foundation

extension String {
    func containsDigit() -> Bool {
        for index in self.indices {
            guard !self[index].isNumber else { return true }
        }
        return false
    }
}
