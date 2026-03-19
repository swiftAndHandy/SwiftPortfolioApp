//
//  AppState.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import Foundation

@Observable
class AppState {
    var selectedFilter: Filter? = Filter.all
    var selectedIssue: Issue?
    
    var filterText = ""
    var filterTokens = [Tag]()
    
    func suggestedFilterTokens(from allTags: [Tag]) -> [Tag] {
        guard filterText.starts(with: "#") else { return [] }
        let trimmed = String(filterText.dropFirst()).trimmingCharacters(in: .whitespaces)
        
        if trimmed.isEmpty {
            print(allTags)
            return allTags
        }
        
        return allTags.filter { $0.name.localizedCaseInsensitiveContains(trimmed) }
    }
}
