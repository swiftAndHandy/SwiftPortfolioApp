//
//  Tag+Equatable.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 17.03.26.
//

import Foundation

extension Tag: Equatable {
    public static func ==(lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
    }
}
