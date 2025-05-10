import SwiftData
import Foundation

@Model
final class CoffeeRecipe {
    var dose: Double
    var createdAt: Date
    var bean: CoffeeBean
    @Relationship(deleteRule: .cascade) var attributes: [RecipeAttribute] = []
    
    init(dose: Double, bean: CoffeeBean) {
        self.dose = dose
        self.createdAt = Date()
        self.bean = bean
    }
} 