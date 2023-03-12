//
//  APIManager.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 28.02.23.
//


import Foundation

enum Endpoint {
    case getRandomRecipes(key: String)
    case getRecipesByType(key: String, type: String)
    //    case getCurrentRecipe(key: String, ID: Int) //закомментил, т.к. к конкретному рецепту можно обратиться по его айди, который идет с каждым запросом. Или просто передать тот рецепт, на который ткнул юзер таким же образом.  Цель: экономия запросов.
}

extension Endpoint {
    var spoonacularURL: String {
        return "https://api.spoonacular.com/recipes"
    }
    
    var url: URL {
        switch self {
        case .getRandomRecipes(let key):
            if let url = URL(string: spoonacularURL.appending("/random?apiKey=\(key)&number=30")) {
                return url
            }
            fatalError()
        case .getRecipesByType(let key, let type):
            if let url = URL(string: spoonacularURL.appending("/complexSearch?type=\(type)&apiKey=\(key)")) {
                return url
            }
            fatalError()
            //        case .getCurrentRecipe(let key, let ID):
            //            if let url = URL(string: spoonacularURL.appending("/\(ID)/information?apiKey=\(key)")) {
            //                return url
            //            }
            //            fatalError()
        }
    }
}
