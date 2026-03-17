//
//  Tag+Comparable.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 17.03.26.
//

import Foundation

extension Tag: Comparable {
    public static func <(lhs: Tag, rhs: Tag) -> Bool {
        let left = lhs.name.localizedLowercase
        let right = rhs.name.localizedLowercase
        
        if left == right {
            return lhs.id < rhs.id
        } else {
            return left < right
        }
    }
}
