//
//  LocalProductLoader.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import Foundation

public class LocalProductLoader: ProductLoader {
    private let productStore: ProductStore
    public init(productStore: ProductStore) {
        self.productStore = productStore
    }

   public func save(products: [Product]) async {
       for product in products {
           await productStore.save(object: product.item)
       }
    }

    public func loadProducts() async -> [Product] {
        let items: [LocalItem] = await productStore.get()
        var products = [Product]()
        for item in items {
            await products.append(item.product)
        }
        return products
    }
}
