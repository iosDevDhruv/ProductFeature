//
//  Service.swift
//  FeaturedProducts
//
//  Created by Dhruv Jaiswal on 21/11/23.
//

import Foundation

public protocol HTTPClient {
    func request<T: Codable>(router: RouterProtocol) async -> Result<T, NetworkError>
}

public enum HTTPMethod {
    case get([URLQueryItem])
    case post(T: Encodable)

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
