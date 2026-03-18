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
