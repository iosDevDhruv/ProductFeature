//
//  RemoteProductLoader.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import Foundation

public class RemoteProductLoader: ProductLoader {

    private let client: HTTPClient
    public init(client: HTTPClient) {
        self.client = client
    }

    public func loadProducts() async throws -> [Product] {
        let route = Router.products(brand: .maybelline)
        let service: Result<[Item], NetworkError> = await client.request(router: route)
        switch service {
        case .success(let items):
            let products = items.map { $0.product}
            return products
        case .failure(let failure):
            throw failure
        }
    }
}

private struct Item: Codable {
    let id: Int
    let brand: String
    let name, price: String
    let priceSign, currency: String?
    let imageLink: String
    let productLink: String
    let websiteLink: String
    let description: String
    let rating: Double?
    let category: String?
    let productType: String
    let tagList: [String?]
    let createdAt, updatedAt: String
    let productAPIURL: String
    let apiFeaturedImage: String

    enum CodingKeys: String, CodingKey {
        case id, brand, name, price
        case priceSign = "price_sign"
        case currency
        case imageLink = "image_link"
        case productLink = "product_link"
        case websiteLink = "website_link"
        case description, rating, category
        case productType = "product_type"
        case tagList = "tag_list"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case productAPIURL = "product_api_url"
        case apiFeaturedImage = "api_featured_image"
    }

    var product: Product {
        return .init(id: id, brand: brand, name: name, price: price, priceSign: priceSign ?? "£", currency: currency ?? "GBP", imageLink: imageLink, description: description, rating: rating ?? 0, category: category ?? "", productType: productType, tagList: tagList.compactMap {$0}, createdAt: createdAt)
    }
}
