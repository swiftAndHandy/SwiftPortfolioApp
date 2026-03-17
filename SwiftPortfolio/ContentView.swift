//
//  ContentView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) var appState
    @Query var allIssues: [Issue]
    
    var issues: [Issue] {
        let filter = appState.selectedFilter ?? .all
        
        if let tag = filter.tag {
            return allIssues.filter { issue in
                issue.tags?.contains(tag) ?? false
            }
        } else {
            return allIssues.filter { issue in
                issue.modificationDate > filter.minModificationDate
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(issues) { issue in
                Text(issue.title)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(.sampleData)
        .environment(AppState())
}
