//
//  LocalProductLoaderTests.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import XCTest
import ProductFeature

final class LocalProductLoaderTests: XCTestCase {

    private var localRemoteLoader: LocalProductLoader!
    private var remoteProductLoader: RemoteProductLoader!

    override func setUp() async throws {
        let httpClient = URLSessionClient()
        let productStore = await RealmClient()
        remoteProductLoader = RemoteProductLoader(client: httpClient)
        localRemoteLoader = LocalProductLoader(productStore: productStore)
    }

    func saveData() async throws {
        let products = try await remoteProductLoader.loadProducts()
        await localRemoteLoader.save(products: products)
    }

    func test_getProducts_afterSavingData() async throws {
        do {
            try await saveData()
            let result = await localRemoteLoader.loadProducts()
            XCTAssertEqual(result.count, 54)
        } catch {
            XCTFail()
        }
    }

    func test_getProducts_fromLocal() async throws {
        do {
            let result = try await remoteProductLoader.loadProducts()
            XCTAssertEqual(result.count, 54)
        } catch {
            XCTFail()
        }
    }
}
