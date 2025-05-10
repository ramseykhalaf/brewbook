import SwiftUI
import SwiftData

struct EditBeanView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var bean: CoffeeBean
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Bean Details") {
                    TextField("Bean Name", text: $bean.name)
                    TextField("Origin", text: $bean.origin)
                    TextField("Roaster", text: $bean.roaster)
                    DatePicker(
                        "Roast Date",
                        selection: $bean.roastDate,
                        displayedComponents: .date
                    )
                }
            }
            .navigationTitle("Edit Coffee Bean")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                    .disabled(bean.name.isEmpty || bean.origin.isEmpty || bean.roaster.isEmpty)
                }
            }
        }
    }
} 