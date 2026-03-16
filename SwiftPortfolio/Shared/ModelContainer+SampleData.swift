//
//  ModelContainer+SampleData.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import Foundation
import SwiftData

extension ModelContainer {
    static var sampleData: ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            let container = try ModelContainer(for: Issue.self, Tag.self, configurations: config)
            try container.mainContext.createSampleData()
            return container
        } catch {
            fatalError("SampleData container failed: \(error)")
        }
    }
}

extension ModelContext {
    func createSampleData() throws {
        try delete(model: Tag.self)
        try delete(model: Issue.self)
        
        for i in 1...5 {
            let tag = Tag(name: "Tag \(i)")
            insert(tag)
            
            for j in 1...10 {
                let issue = Issue(title: "Issue \(i)-\(j)", content: "Description goes here", priority: Int.random(in: 0...2), completed: Bool.random())
                insert(issue)
                tag.issues?.append(issue)
            }
        }
        
        try save()
    }
}
