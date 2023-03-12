//
//  RecipesManager.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 28.02.23.
//

import Foundation

protocol RestAPIProviderProtocol {
    func getRandomRecipes(completionHandler: @escaping ( RecipesModel ) -> Void)
    func getRecipesByType(forType type: String, complitionHandler: @escaping(RecipesByTypeModel) -> Void)
    func getCurrentRecipesByID(forID ID: Int, completionHandler: @escaping ( Recipe ) -> Void)
    func getRecipesByKey(forKey keyWord: String, completionHandler: @escaping ( RecipesByTypeModel ) -> Void)
}

class RecipesManager: RestAPIProviderProtocol {
   
    private var spoonacularAPIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "spoonacularAPIKey") as? String else { return ""}
        return key
    }
    
    func getRandomRecipes(completionHandler: @escaping ( RecipesModel ) -> Void) {
        let endpoint = Endpoint.getRandomRecipes(key: spoonacularAPIKey)
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let randomRecipes = try decoder.decode(RecipesModel.self, from: data)
                    completionHandler(randomRecipes)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    func getRecipesByType(forType type: String, complitionHandler: @escaping (RecipesByTypeModel) -> Void) {
        let endpoint = Endpoint.getRecipesByType(key: spoonacularAPIKey, type: type)
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let recipesByType = try decoder.decode(RecipesByTypeModel.self, from: data)
                    complitionHandler(recipesByType)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    func getCurrentRecipesByID(forID ID: Int, completionHandler: @escaping ( Recipe ) -> Void) {
        let endpoint = Endpoint.getCurrentRecipe(key: spoonacularAPIKey, ID: ID)
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let randomRecipes = try decoder.decode(Recipe.self, from: data)
                    completionHandler(randomRecipes)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    func getRecipesByKey(forKey keyWord: String, completionHandler: @escaping ( RecipesByTypeModel ) -> Void) {
        let endpoint = Endpoint.getRecipeByKey(key: spoonacularAPIKey, keyWord: keyWord)
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let recipesByKey = try decoder.decode(RecipesByTypeModel.self, from: data)
                    completionHandler(recipesByKey)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
}
