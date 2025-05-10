//
//  BeanGridView.swift
//  brewbook
//
//  Created by Ramsey Khalaf on 10/5/2025.
//


import SwiftUI
import SwiftData

struct BeanGridView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var beans: [CoffeeBean]
    @State private var showingAddBean = false
    
    // Grid layout with adaptive columns
    private let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                // Add New Bean Button
                AddBeanButton(action: {
                    showingAddBean = true
                })
                
                // Existing Beans
                ForEach(beans) { bean in
                    BeanGridItem(bean: bean)
                }
            }
            .padding()
        }
        .navigationTitle("Coffee Beans")
        .sheet(isPresented: $showingAddBean) {
            AddBeanView()
        }
    }
}