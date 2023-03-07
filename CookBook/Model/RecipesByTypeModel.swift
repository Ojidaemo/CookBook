//
//  RecipesByTypeModel.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 28.02.23.
//

import Foundation

struct RecipesByTypeModel: Decodable {
    let results: [Result]?
    let offset, number, totalResults: Int
}

struct Result: Decodable, Equatable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
