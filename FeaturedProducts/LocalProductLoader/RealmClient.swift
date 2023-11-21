//
//  LocalClient.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 22/11/23.
//

import Foundation
import RealmSwift

@MainActor public class RealmClient: ProductStore {

    private let realm: Realm

    public init() async {
        realm = try! await Realm()
    }

    public func save<T>(object: T) async {
        guard let object = object as? Object else {return}
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            debugPrint(error)
        }
    }

    public func get<T>() async -> [T] {
            guard T.self is Object.Type else {return []}
            let objects = Array(realm.objects(T.self as! Object.Type))
            guard let items = objects as? [T] else {return []}
            return items
    }
}
