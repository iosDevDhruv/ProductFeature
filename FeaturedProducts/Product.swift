//
//  Featured Products.swift
//  FeaturedProducts
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import Foundation

public struct Product {
    public let id: Int
    public  let brand: String
    public  let name: String
    public let price: String
    public let priceSign: String
    public let currency: String
    public let imageLink: String
    public let description: String
    public let rating: Double
    public let category: String
    public let productType: String
    public let tagList: [String]
    public  let createdAt: String

    public init(id: Int, brand: String, name: String, price: String, priceSign: String, currency: String, imageLink: String, description: String, rating: Double, category: String, productType: String, tagList: [String], createdAt: String) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.priceSign = priceSign
        self.currency = currency
        self.imageLink = imageLink
        self.description = description
        self.rating = rating
        self.category = category
        self.productType = productType
        self.tagList = tagList
        self.createdAt = createdAt
    }
}
