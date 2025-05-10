import SwiftUI
import SwiftData

struct AddRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let bean: CoffeeBean
    @State private var dose: Double = 18.0
    
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
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveRecipe() {
        let recipe = CoffeeRecipe(dose: dose, bean: bean)
        modelContext.insert(recipe)
    }
} 