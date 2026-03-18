//
//  Issue.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import Foundation
import SwiftData

@Model
class Issue {
    var id = UUID()
    var title: String = ""
    var content: String = ""
    var priority: Int = 0
    var completed: Bool = false
    var creationDate: Date = Date.now
    var modificationDate: Date = Date.now
    var tags: [Tag]?
    
    var issueStatus: String {
        completed ? "Closed" : "Open"
    }
    
    var tagList: String {
        guard let tags else { return "No tags" }
        if tags.isEmpty {
            return "No tags"
        }
        return tags.sorted().map(\.name).formatted()
    }
    
    init(title: String, content: String, priority: Int, completed: Bool, tags: [Tag]? = []) {
        self.title = title
        self.content = content
        self.priority = priority
        self.completed = completed
        self.creationDate = .now
        self.modificationDate = .now
        self.tags = tags
    }
}
