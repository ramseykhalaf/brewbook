import SwiftData
import Foundation
import SwiftUI  // Add this import

@Model
final class CoffeeBean {
    var name: String
    var origin: String
    var roaster: String
    var roastDate: Date
    var dateAdded: Date
    
    init(name: String, origin: String, roaster: String, roastDate: Date) {
        self.name = name
        self.origin = origin
        self.roaster = roaster
        self.roastDate = roastDate
        self.dateAdded = Date()
    }
    
    // Computed property to get days since roasting
    var daysSinceRoast: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: roastDate, to: Date())
        return components.day ?? 0
    }
    
    // Computed property to determine if beans are within optimal freshness window
    var freshness: Freshness {
        let days = daysSinceRoast
        
        if days < 0 {
            return .future
        } else if days < 4 {
            return .tooFresh
        } else if days < 21 {
            return .optimal
        } else if days < 45 {
            return .stale
        } else {
            return .veryStale
        }
    }
}
