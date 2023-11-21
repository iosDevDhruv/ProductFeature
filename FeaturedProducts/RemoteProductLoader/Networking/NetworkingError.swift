//
//  NetworkingError.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 24/11/23.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case encodingError
    case connectivityError

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .decodingError:
            return "Decoding error"
        case .encodingError:
            return "Encoding error"
        case .connectivityError:
            return "No Internet Connection"
        }
    }
}
