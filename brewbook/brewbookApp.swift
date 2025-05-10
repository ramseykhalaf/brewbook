import SwiftUI
import SwiftData

@main
struct CoffeeTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CoffeeBean.self)
    }
}
