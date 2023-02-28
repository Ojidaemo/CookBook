//
//  RecipesByTypeModel.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 28.02.23.
//

import Foundation

struct RecipesByTypeModel: Codable {
    let results: [Result]?
    let offset, number, totalResults: Int?
}

struct Result: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: ImageType?
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}

struct RecipesModel: Codable {
    let recipes: [Recipe]?
}
