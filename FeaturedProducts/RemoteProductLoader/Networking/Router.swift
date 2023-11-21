//
//  Router.swift
//  FeaturedProducts
//
//  Created by Dhruv Jaiswal on 21/11/23.

import Foundation

public protocol RouterProtocol {
    var baseURL: String {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var headers: [String: String] {get}
}

public enum Router: RouterProtocol {

    case products(brand: Brand)

    public var baseURL: String {
        return "https://makeup-api.herokuapp.com/api/v1/"
    }

    public var path: String {
        switch self {
        case .products:
            return "products.json"
        }
    }

    public var httpMethod: HTTPMethod {
        switch self {
        case .products(let brand):
            let urlQuery = URLQueryItem(name: "brand", value: brand.rawValue)
            return .get([urlQuery])
        }
    }

    public var headers: [String: String] {
        switch self {
        case .products:
            return [:]
        }
    }
}
