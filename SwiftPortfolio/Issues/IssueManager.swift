//
//  IssueManager.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 18.03.26.
//

import Foundation


import SwiftData
import Foundation

struct IssueManager {
    let modelContext: ModelContext
    
    func missingTags(from issue: Issue) -> [Tag] {
        var descriptor = FetchDescriptor<Tag>()
        descriptor.sortBy = [SortDescriptor(\Tag.name)]
        let allTags = (try? modelContext.fetch(descriptor)) ?? []
        let issueTags = Set(issue.tags ?? [])
        return Set(allTags).subtracting(issueTags).sorted()
    }
}
