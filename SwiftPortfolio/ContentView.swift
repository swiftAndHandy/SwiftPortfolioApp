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
    @Query(sort: \Issue.title) private var allIssues: [Issue]
    @Query(sort: \Tag.name) private var allTags: [Tag]
    
    var issues: [Issue] {
        let filter = appState.selectedFilter ?? .all
        var result: [Issue]
        
        if let tag = filter.tag {
            result = allIssues.filter { issue in
                issue.tags?.contains(tag) ?? false
            }
        } else {
            result = allIssues.filter { issue in
                issue.modificationDate > filter.minModificationDate
            }
        }
        
        if !appState.filterTokens.isEmpty {
            result = result.filter { issue in
                appState.filterTokens.allSatisfy { token in
                    issue.tags?.contains(token) ?? false
                }
            }
        }
        
        let trimmed = appState.filterText.trimmingCharacters(in: .whitespaces)
        if !trimmed.isEmpty && !trimmed.starts(with: "#") {
            result = result.filter { issue in
                issue.title.localizedCaseInsensitiveContains(trimmed) ||
                issue.content.localizedCaseInsensitiveContains(trimmed)
            }
        }
        
        return result
    }
    
    var suggestedTokens: [Tag] {
        appState.suggestedFilterTokens(from: allTags)
    }
    
    var body: some View {
        @Bindable var appState = appState
        List(selection: $appState.selectedIssue) {
            ForEach(issues) { issue in
                IssueRowView(issue: issue)
            }
            .onDelete(perform: delete)
        }
        .searchable(
            text: $appState.filterText,
            tokens: $appState.filterTokens,
            prompt: "Filter issues, or type # to add tags"
        ) { tag in
            Text(tag.name)
        }
        .searchSuggestions {
            if appState.filterText.starts(with: "#") {
                ForEach(suggestedTokens) { tag in
                    Button {
                        appState.filterTokens.append(tag)
                        appState.filterText = ""
                    } label: {
                        Label(tag.name, systemImage: "tag")
                    }
                }
            }
        }
    }
    
    func delete(_ offsets: IndexSet) {
        for offset in offsets {
            let item = issues[offset]
            if appState.selectedIssue == item {
                appState.selectedIssue = nil
            }
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(.sampleData)
        .environment(AppState())
}
