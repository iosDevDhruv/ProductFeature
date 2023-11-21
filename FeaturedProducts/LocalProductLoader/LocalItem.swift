//
//  LocalItem.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import Foundation
import RealmSwift

@MainActor final class LocalItem: Object {
@Persisted(primaryKey: true) var id: Int
@Persisted var brand: String
@Persisted var  name: String
@Persisted var price: String
@Persisted var priceSign: String
@Persisted var currency: String
@Persisted var imageLink: String
@Persisted var productDescription: String
@Persisted var rating: Double
@Persisted var category: String
@Persisted var productType: String
@Persisted var  createdAt: String

convenience init(id: Int, brand: String, name: String, price: String, priceSign: String, currency: String, imageLink: String, productDescription: String, rating: Double, category: String, productType: String, createdAt: String) {
  self.init()
  self.id = id
    self.brand = brand
    self.name = name
    self.price = price
    self.priceSign = priceSign
    self.currency = currency
    self.imageLink = imageLink
    self.productDescription = productDescription
    self.rating = rating
    self.category = category
    self.productType = productType
    self.createdAt = createdAt
}
}

extension LocalItem {
var product: Product {
    return Product(id: id, brand: brand, name: name, price: price, priceSign: priceSign, currency: currency, imageLink: imageLink, description: description, rating: rating, category: category, productType: productType, tagList: [], createdAt: createdAt)
}
}

extension Product {
var item: LocalItem {
    get async {
        return await LocalItem(id: id, brand: brand, name: name, price: price, priceSign: priceSign, currency: currency, imageLink: imageLink, productDescription: description, rating: rating, category: category, productType: productType, createdAt: createdAt)
    }
}
}
