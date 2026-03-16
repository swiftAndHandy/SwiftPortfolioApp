//
//  SwiftPortfolioApp.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

@main
struct SwiftPortfolioApp: App {
    
    let container: ModelContainer
    
    init() {
        do {
            let schema = Schema([Issue.self, Tag.self])
            let config = ModelConfiguration(cloudKitDatabase: .automatic)
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
