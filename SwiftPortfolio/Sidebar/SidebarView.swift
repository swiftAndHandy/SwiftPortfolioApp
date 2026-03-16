//
//  SidebarView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

struct SidebarView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Tag.name) var tags: [Tag]
    
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.id, name: tag.name, icon: "tag", tag: tag)
        }
    }
    
    let smartFilters: [Filter] = [.all, .recent]
    
    var body: some View {
        @Bindable var appState = appState
        List(selection: $appState.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
        }
        .toolbar {
            Button {
                try? modelContext.createSampleData()
            } label: {
                Label("Add samples", systemImage: "flame")
            }
        }
    }
}

#Preview {
    SidebarView()
        .modelContainer(.sampleData)
        .environment(AppState())
}
