//
//  PreloadDataManager.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 2.03.23.
//

import Foundation

class PreloadData {
    
    private let getRandomRecipesListDelegate: RestAPIProviderProtocol = RecipesManager()
    
    var randomRecipesArray: [RecipesModel] = []
    static var favoriteRecips: [Result] = [] // Массив сохраненных любых рецептов
    
    func configure() {
        getRandomRecipesListDelegate.getRandomRecipes { [weak self] recipesData in
            
            guard let self = self else { return }
            self.randomRecipesArray.append(recipesData)
//            print("первоначально приходит в массив: \(self.randomRecipesArray.count)")
        }
    }
}
