//
//  Issue+Equatable.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 17.03.26.
//

import Foundation

extension Issue: Equatable {
    public static func ==(lhs: Issue, rhs: Issue) -> Bool {
        lhs.id == rhs.id
    }
}
