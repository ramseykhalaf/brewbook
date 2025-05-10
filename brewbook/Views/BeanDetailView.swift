import SwiftUI

struct BeanDetailView: View {
    @Bindable var bean: CoffeeBean
    @State private var showingEditSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(bean.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Label(
                        title: {
                            Text(bean.freshness.description)
                        },
                        icon: {
                            Image(systemName: "circle.fill")
                                .foregroundColor(bean.freshness.color)
                        }
                    )
                    
                    Spacer()
                    
                    Text("\(bean.daysSinceRoast) days since roast")
                }
                .padding()
                .background(bean.freshness.color.opacity(0.1))
                .cornerRadius(8)
                
                Group {
                    DetailRow(icon: "map", label: "Origin", value: bean.origin)
                    DetailRow(icon: "building.2", label: "Roaster", value: bean.roaster)
                    DetailRow(
                        icon: "flame",
                        label: "Roast Date",
                        value: bean.roastDate.formatted(date: .long, time: .omitted)
                    )
                    DetailRow(
                        icon: "calendar",
                        label: "Added",
                        value: bean.dateAdded.formatted(date: .long, time: .omitted)
                    )
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingEditSheet = true
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
        .sheet(isPresented: $showingEditSheet) {
            EditBeanView(bean: bean)
        }
    }
}
