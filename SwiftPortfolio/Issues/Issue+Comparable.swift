//
//  Issue+Comparable.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 17.03.26.
//

import Foundation

extension Issue: Comparable {
    public static func <(lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.title.localizedLowercase
        let right = rhs.title.localizedLowercase
        
        if left == right {
            return lhs.creationDate < rhs.creationDate
        } else {
            return left < right
        }
    }
}
