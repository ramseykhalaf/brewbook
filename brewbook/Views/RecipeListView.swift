import SwiftUI
import SwiftData

struct RecipeListView: View {
    @Query(sort: [SortDescriptor(\CoffeeRecipe.createdAt, order: .reverse)]) var recipes: [CoffeeRecipe]
    
    var body: some View {
        NavigationStack {
            List(recipes) { recipe in
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dose: \(recipe.dose, specifier: "%.1f") g")
                        .font(.headline)
                    Text("Bean: \(recipe.bean.name)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(recipe.createdAt, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Recipes")
        }
    }
} 
