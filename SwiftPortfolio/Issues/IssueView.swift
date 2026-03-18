//
//  IssueView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 18.03.26.
//

import SwiftUI
import SwiftData

struct IssueView: View {
    var issue: Issue
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let container = ModelContainer.sampleData
    let issue = try! container.mainContext.fetch(FetchDescriptor<Issue>()).first!
    IssueView(issue: issue)
        .modelContainer(container)
        .environment(AppState())
}
