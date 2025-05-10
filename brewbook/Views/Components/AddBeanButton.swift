//
//  AddBeanButton.swift
//  brewbook
//
//  Created by Ramsey Khalaf on 10/5/2025.
//


import SwiftUI

struct AddBeanButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: "plus")
                    .font(.largeTitle)
                Text("Add Bean")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
                    .opacity(0.3)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}