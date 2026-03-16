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
    var id = UUID()
    var name: String
    @Relationship(deleteRule: .nullify, inverse: \Issue.tags) var issues: [Issue]
    
    init(name: String, issues: [Issue] = []) {
        self.name = name
        self.issues = issues
    }
}
