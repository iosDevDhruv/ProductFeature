//
//  RemoteProductLoaderTests.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import XCTest
import ProductFeature

final class RemoteProductLoaderTests: XCTestCase {

    func test_getProducts() async {
        do {
            let client: HTTPClient = URLSessionClient()
            let sut = RemoteProductLoader(client: client)
            let result = try await sut.loadProducts()
            XCTAssertEqual(result.count, 54)
        } catch {
            XCTFail()
        }
    }

}
