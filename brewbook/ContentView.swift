import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                BeanGridView()
            }
            .tabItem {
                Label("Beans", systemImage: "leaf")
            }
            
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "cup.and.saucer")
                }
        }
    }
}
