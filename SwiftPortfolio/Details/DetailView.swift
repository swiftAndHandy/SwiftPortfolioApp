//
//  DetailView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack {
            if let issue = appState.selectedIssue {
                IssueView(issue: issue)
            } else {
                NoIssueView()
            }
        }
        .navigationTitle("Details")
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

#Preview {
    DetailView()
        .modelContainer(.sampleData)
        .environment(AppState())
}
