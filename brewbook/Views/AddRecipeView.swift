import SwiftUI
import SwiftData

struct AddRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let bean: CoffeeBean
    @State private var dose: Double = 18.0
    @State private var showingAddAttribute = false
    @State private var recipe: CoffeeRecipe?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Recipe Details") {
                    HStack {
                        Text("Dose")
                        Spacer()
                        TextField("Dose", value: $dose, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100)
                        Text("g")
                    }
                }
                
                Section("Attributes") {
                    if let recipe = recipe {
                        ForEach(recipe.attributes) { attribute in
                            HStack {
                                Text(attribute.name)
                                Spacer()
                                Text(attribute.value)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Button {
                        if recipe == nil {
                            // Create recipe if it doesn't exist
                            let newRecipe = CoffeeRecipe(dose: dose, bean: bean)
                            modelContext.insert(newRecipe)
                            recipe = newRecipe
                        }
                        showingAddAttribute = true
                    } label: {
                        Label("Add Attribute", systemImage: "plus.circle.fill")
                    }
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        if let recipe = recipe {
                            modelContext.delete(recipe)
                        }
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if recipe == nil {
                            let newRecipe = CoffeeRecipe(dose: dose, bean: bean)
                            modelContext.insert(newRecipe)
                            recipe = newRecipe
                        }
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $showingAddAttribute) {
                if let recipe = recipe {
                    AddAttributeView(recipe: recipe)
                }
            }
            .onAppear {
                // Create recipe immediately when view appears
                if recipe == nil {
                    let newRecipe = CoffeeRecipe(dose: dose, bean: bean)
                    modelContext.insert(newRecipe)
                    recipe = newRecipe
                }
            }
        }
    }
} 
