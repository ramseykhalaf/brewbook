import SwiftData
import Foundation

@Model
final class CoffeeRecipe {
    var dose: Double
    var createdAt: Date
    var bean: CoffeeBean
    
    init(dose: Double, bean: CoffeeBean) {
        self.dose = dose
        self.createdAt = Date()
        self.bean = bean
    }
} 