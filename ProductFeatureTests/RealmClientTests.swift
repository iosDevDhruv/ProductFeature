//
//  RealmClientTests.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 24/11/23.
//

import XCTest
import ProductFeature
import RealmSwift

final class RealmClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_realmInitWithoutError() async {
        let sut = await RealmClient()
        XCTAssertNotNil(sut)
    }

    func test_realmSaveFunc() async {
        let sut = await RealmClient()
        let object = TestModel()
        await sut.save(object: object)
    }

    func test_realmGetFunc() async {
        let sut = await RealmClient()
        let object = TestModel()
        await sut.save(object: object)
        let result: [TestModel] = await sut.get()
        XCTAssertNotEqual(result.count, 0)
    }
}

// MARK: - Helper
final class TestModel: Object {
   @Persisted(primaryKey: true) var id: UUID = UUID()
}
