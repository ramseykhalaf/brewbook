import SwiftData
import Foundation

enum AttributeType: String, Codable {
    case numeric
    case string
}

@Model
final class RecipeAttribute {
    var name: String
    var type: AttributeType
    var numericValue: Double?
    var stringValue: String?
    var recipe: CoffeeRecipe
    
    init(name: String, type: AttributeType, recipe: CoffeeRecipe) {
        self.name = name
        self.type = type
        self.recipe = recipe
    }
    
    var value: String {
        switch type {
        case .numeric:
            return numericValue.map { String(format: "%.1f", $0) } ?? ""
        case .string:
            return stringValue ?? ""
        }
    }
} 