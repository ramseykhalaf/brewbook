import SwiftUI
import SwiftData

struct AddBeanView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var origin: String = ""
    @State private var roaster: String = ""
    @State private var hasRoastDate: Bool = false
    @State private var roastDate: Date = Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Bean Details") {
                    TextField("Bean Name", text: $name)
                    TextField("Origin", text: $origin)
                    TextField("Roaster", text: $roaster)
                    DatePicker(
                            "Roast Date",
                            selection: $roastDate,
                            displayedComponents: .date
                        )
                }
            }
            .navigationTitle("Add Coffee Bean")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveBean()
                        dismiss()
                    }
                    .disabled(name.isEmpty || origin.isEmpty || roaster.isEmpty)
                }
            }
        }
    }
    
    private func saveBean() {
        let newBean = CoffeeBean(
            name: name,
            origin: origin,
            roaster: roaster,
            roastDate: roastDate
        )
        modelContext.insert(newBean)
    }
}
