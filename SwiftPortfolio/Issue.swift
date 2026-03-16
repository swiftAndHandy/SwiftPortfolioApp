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
    @Relationship(deleteRule: .nullify) var tags: [Tag]
    
    var title: String
    var content: String
    var priority: Int16
    var completed: Bool
    var creationDate: Date
    var modificationDate: Date
    
    init(title: String, content: String, priority: Int16, completed: Bool, tags: [Tag] = []) {
        self.title = title
        self.content = content
        self.priority = priority
        self.completed = completed
        self.creationDate = .now
        self.modificationDate = .now
        self.tags = tags
    }
}
