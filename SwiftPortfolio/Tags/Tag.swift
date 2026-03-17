//
//  Tag.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import Foundation
import SwiftData

@Model
class Tag {
    @Relationship(deleteRule: .nullify, inverse: \Issue.tags) var issues: [Issue]?
    
    var id = UUID()
    var name: String = ""
    
    var activeIssues: [Issue] {
        (issues ?? []).filter { !$0.completed }
    }
    
    init(name: String, issues: [Issue] = []) {
        self.name = name
        self.issues = issues
    }
}
