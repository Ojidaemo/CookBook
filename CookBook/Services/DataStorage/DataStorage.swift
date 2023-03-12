//
//  DataStorage.swift
//  CookBook
//
//  Created by Alexandr Rodionov on 8.03.23.
//

import Foundation

final class DataStorage {
    
    private init() {}
    static let shared = DataStorage()
    
    let defaults = UserDefaults.standard
    
    func saveData(dataToSave: [Result]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(dataToSave) {
            defaults.set(encoded, forKey: "favorite")
        }
    }
    
    func loadData(key: String) -> [Result] {
        if let savedData = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([Result].self, from: savedData) {
                return loadedData
            }
        }
        return []
    }
}
