//
//  URLSessionClientTests.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 24/11/23.
//

import XCTest
import ProductFeature

final class URLSessionClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_urlSessionClient() async {
        let sut = URLSessionClient()
        let route = Router.products(brand: .maybelline)
        let result: Result<[Item], NetworkError> = await sut.request(router: route)
        switch result {
        case .success(let success):
            XCTAssert(!success.isEmpty)
        case .failure(let failure):
            XCTFail(failure.localizedDescription)
        }
    }

    func test_urlSessionClient_shouldFailWithIncorrectModel() async {
        let sut = URLSessionClient()
        let route = Router.products(brand: .maybelline)
        let result: Result<[String], NetworkError> = await sut.request(router: route)
        switch result {
        case .success:
            XCTFail()
        case .failure:
            XCTAssert(true)
        }
    }

    // MARK: - Helper
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
    }
}
