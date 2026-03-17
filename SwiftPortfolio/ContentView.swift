//
//  ContentView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Issue.title) var allIssues: [Issue]
    
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
                IssueRowView(issue: issue)
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(_ offsets: IndexSet) {
        for offset in offsets {
            let item = issues[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(.sampleData)
        .environment(AppState())
}
