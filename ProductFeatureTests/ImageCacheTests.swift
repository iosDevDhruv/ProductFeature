//
//  ImageCacheTests.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 23/11/23.
//

import XCTest
import ProductFeature

final class ImageCacheTests: XCTestCase {

    private var store: RealmClient!
    private var remoteProductLoader: RemoteProductLoader!

    override func setUp() async throws {
        let httpClient = URLSessionClient()
        let productStore = await RealmClient()
        remoteProductLoader = RemoteProductLoader(client: httpClient)
        store = productStore
    }

    func test_save_imageCache() async {
        do {
            let sut = await ImageCacheClient(store: store)
            let client = URLSessionClient()
            let remoteProductLoader = RemoteProductLoader(client: client)
            let products = try await remoteProductLoader.loadProducts()
            for product in products {
                guard let data = await loadImage(url: product.imageLink) else {continue}
                sut.setImage(data, for: product.imageLink)
                XCTAssertNotNil(sut.getImage(for: product.imageLink))
            }
        } catch {
            XCTFail()
        }
    }

    func test_imageLoadFromCache() async {
        do {
            let sut = await ImageCacheClient(store: store)
            let client = URLSessionClient()
            let remoteProductLoader = RemoteProductLoader(client: client)
            let products = try await remoteProductLoader.loadProducts()
            for product in products {
                XCTAssertNotNil(sut.getImage(for: product.imageLink))
            }
        } catch {
            XCTFail()
        }
    }

   // MARK: - Helpers
   private func loadImage(url: String) async -> Data? {
        do {
            guard let url = URL(string: url) else {return nil}
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
    }

}
