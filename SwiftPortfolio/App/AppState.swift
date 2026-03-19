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

}
