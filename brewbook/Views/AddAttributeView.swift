import SwiftUI
import SwiftData

struct AddAttributeView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let recipe: CoffeeRecipe
    @State private var name: String = ""
    @State private var type: AttributeType = .numeric
    @State private var numericValue: Double = 0.0
    @State private var stringValue: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Attribute Details") {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        Text("Numeric").tag(AttributeType.numeric)
                        Text("String").tag(AttributeType.string)
                    }
                    
                    if type == .numeric {
                        HStack {
                            Text("Value")
                            Spacer()
                            TextField("Value", value: $numericValue, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .frame(width: 100)
                        }
                    } else {
                        TextField("Value", text: $stringValue)
                    }
                }
            }
            .navigationTitle("New Attribute")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveAttribute()
                        dismiss()
                    }
                    .disabled(name.isEmpty || (type == .string && stringValue.isEmpty))
                }
            }
        }
    }
    
    private func saveAttribute() {
        let attribute = RecipeAttribute(name: name, type: type, recipe: recipe)
        if type == .numeric {
            attribute.numericValue = numericValue
        } else {
            attribute.stringValue = stringValue
        }
        modelContext.insert(attribute)
    }
} 