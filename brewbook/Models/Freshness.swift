//
//  Freshness.swift
//  brewbook
//
//  Created by Ramsey Khalaf on 10/5/2025.
//


import SwiftUI

enum Freshness {
    case tooFresh
    case optimal
    case stale
    case veryStale
    case unknown
    case future
    
    // Color representation for visual indicators
    var color: Color {
        switch self {
        case .tooFresh:
            return .blue
        case .optimal:
            return .green
        case .stale:
            return .orange
        case .veryStale:
            return .red
        case .unknown:
            return .gray
        case .future:
            return .purple
        }
    }
    
    // Text description
    var description: String {
        switch self {
        case .tooFresh:
            return "Too Fresh (Degassing)"
        case .optimal:
            return "Peak Freshness"
        case .stale:
            return "Past Peak"
        case .veryStale:
            return "Stale"
        case .unknown:
            return "Unknown"
        case .future:
            return "Invalid Date"
        }
    }
}