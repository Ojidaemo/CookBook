//
//  RecipesModel.swift
//  CookBook
//
//  Created by Eldar Garbuzov on 28.02.23.
//

import Foundation

struct RecipesModel: Decodable {
    let recipes: [Recipe]?
}

// MARK: - Recipe
struct Recipe: Decodable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let gaps: String
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let creditsText, sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String
    let image: String
    let imageType, summary: String
    let dishTypes, diets: [String]
    let instructions: String
    let analyzedInstructions: [AnalyzedInstruction]
    let spoonacularSourceURL: String

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case image, imageType, summary, cuisines, dishTypes, diets, occasions, instructions, analyzedInstructions
        case originalID = "originalId"
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        vegetarian = try values.decode(Bool.self, forKey: .vegetarian); vegan = try values.decode(Bool.self, forKey: .vegan)
        glutenFree = try values.decode(Bool.self, forKey: .glutenFree); dairyFree = try values.decode(Bool.self, forKey: .dairyFree)
        veryHealthy = try values.decode(Bool.self, forKey: .veryHealthy); cheap = try values.decode(Bool.self, forKey: .cheap)
        veryPopular = try values.decode(Bool.self, forKey: .veryPopular);  sustainable = try values.decode(Bool.self, forKey: .sustainable)
        lowFodmap = try values.decode(Bool.self, forKey: .lowFodmap); weightWatcherSmartPoints = try values.decode(Int.self, forKey: .weightWatcherSmartPoints)
        gaps = try values.decode(String.self, forKey: .gaps); preparationMinutes = try values.decode(Int.self, forKey: .preparationMinutes)
        cookingMinutes = try values.decode(Int.self, forKey: .cookingMinutes); aggregateLikes = try values.decode(Int.self, forKey: .aggregateLikes)
        healthScore = try values.decode(Int.self, forKey: .healthScore); creditsText = try values.decode(String.self, forKey: .creditsText)
        instructions = try values.decode(String.self, forKey: .instructions)
        pricePerServing = try values.decode(Double.self, forKey: .pricePerServing); extendedIngredients = try values.decode([ExtendedIngredient].self, forKey: .extendedIngredients)
        id = try values.decode(Int.self, forKey: .id); title = try values.decode(String.self, forKey: .title)
        readyInMinutes = try values.decode(Int.self, forKey: .readyInMinutes); servings = try values.decode(Int.self, forKey: .servings)
        sourceURL = try values.decode(String.self, forKey: .sourceURL); image = try values.decode(String.self, forKey: .image)
        imageType = try values.decode(String.self, forKey: .imageType); diets = try values.decode([String].self, forKey: .diets)
        analyzedInstructions = try values.decode([AnalyzedInstruction].self, forKey: .analyzedInstructions); spoonacularSourceURL = try values.decode(String.self, forKey: .spoonacularSourceURL)
        sourceName = try values.decode(String.self, forKey: .sourceName); summary = try values.decode(String.self, forKey: .summary)
        dishTypes = try values.decode([String].self, forKey: .dishTypes)

    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable {
    let name: String
    let steps: [Step]
}

// MARK: - Step
struct Step: Codable {
    let number: Int
    let step: String
    let ingredients: [Ingredient]
    let equipment: [Equipment]
    let length: Length?
}

// MARK: - Equipment
struct Equipment: Codable {
    let id: Int
    let name, localizedName, image: String
    let temperature: Length?
}

// MARK: - Length
struct Length: Codable {
    let number: Int
    let unit: String
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let id: Int
    let name, localizedName, image: String
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable {
    let id: Int
    let aisle, image, consistency, name: String
    let nameClean, original, originalName: String?
    let amount: Double
    let unit: String
    let meta: [String]
    let measures: Measures
}

// MARK: - Measures
struct Measures: Codable {
    let us, metric: Metric
}

// MARK: - Metric
struct Metric: Codable {
    let amount: Double
    let unitShort, unitLong: String
}
