//
//  IssueRowView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 17.03.26.
//

import SwiftUI
import SwiftData

struct IssueRowView: View {
    @Environment(AppState.self) private var appState
    var issue: Issue
    
    var body: some View {
        NavigationLink(value: issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(issue.priority == 2 ? 1 : 0)
                
                VStack(alignment: .leading) {
                    Text(issue.title)
                        .foregroundStyle(.primary)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(issue.tagList)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(issue.creationDate.formatted(date: .numeric, time: .omitted))
                        .font(.subheadline)
                    
                    if issue.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    let container = ModelContainer.sampleData
    let issue = try! container.mainContext.fetch(FetchDescriptor<Issue>()).first!
    IssueRowView(issue: issue)
        .modelContainer(container)
        .environment(AppState())
}
