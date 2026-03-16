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
       
    var title: String = ""
    var content: String = ""
    var priority: Int = 0
    var completed: Bool = false
    var creationDate: Date = Date.now
    var modificationDate: Date = Date.now
    var tags: [Tag]?
    
    init(title: String, content: String, priority: Int, completed: Bool, tags: [Tag]?) {
        self.title = title
        self.content = content
        self.priority = priority
        self.completed = completed
        self.creationDate = .now
        self.modificationDate = .now
        self.tags = tags
    }
}
