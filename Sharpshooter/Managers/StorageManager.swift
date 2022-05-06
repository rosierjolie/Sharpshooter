//
//  StorageManager.swift
//  Sharpshooter
//
//  Created by Jerry Turcios on 1/27/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import Foundation

struct StorageManager {
    static func loadHighScore() -> Int {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "HighScore") as? Int ?? 0
    }

    static func saveNewHighScore(finalScore: Int) {
        let defaults = UserDefaults.standard
        defaults.set(finalScore, forKey: "HighScore")
    }
}
