//
//  NoIssueView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 18.03.26.
//

import SwiftUI

struct NoIssueView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Text("No Issue selected")
            .font(.title)
            .foregroundStyle(.secondary)
        
        Button("New Issue") {
            
        }
    }
}

#Preview {
    NoIssueView()
}
