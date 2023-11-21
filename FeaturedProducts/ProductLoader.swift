//
//  ProductLoader.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 24/11/23.
//

import Foundation

public protocol ProductLoader {
   func loadProducts() async throws -> [Product]
}
