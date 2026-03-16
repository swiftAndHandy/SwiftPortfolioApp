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
        let container = try! ModelContainer(for: Issue.self, Tag.self, configurations: config)
        
        let context = container.mainContext
        
        for i in 1...5 {
            let tag = Tag(name: "Tag \(i)")
            context.insert(tag)
            
            for j in 1...10 {
                let issue = Issue(title: "Issue \(i)-\(j)", content: "Description goes here", priority: Int16.random(in: 0...2), completed: Bool.random())
                context.insert(issue)
                tag.issues.append(issue)
            }
        }
        
        try? context.save()
        return container                                
    }
}
