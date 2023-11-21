//
//  ProductStore.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 24/11/23.
//

import Foundation

public protocol ProductStore {
    func save<T>(object: T) async
    func get<T>() async  ->  [T]
}
