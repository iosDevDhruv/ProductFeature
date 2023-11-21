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

    var name: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
