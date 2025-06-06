import SwiftUI

struct BeanGridItem: View {
    let bean: CoffeeBean
    @State private var showingRecipeSheet = false
    
    var body: some View {
        NavigationLink(destination: BeanDetailView(bean: bean)) {
            VStack(alignment: .leading) {
                // Top color bar indicating freshness
                Rectangle()
                    .fill(bean.freshness.color)
                    .frame(height: 8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(bean.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Text(bean.origin)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Text(bean.roaster)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "calendar")
                            .font(.caption2)
                        Text("\(bean.daysSinceRoast) days old")
                            .font(.caption2)
                    }
                    .foregroundColor(bean.freshness.color)
                    
                    Button {
                        showingRecipeSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "cup.and.saucer.fill")
                            Text("Brew")
                        }
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
                .padding(.top, 4)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingRecipeSheet) {
            AddRecipeView(bean: bean)
        }
    }
}
