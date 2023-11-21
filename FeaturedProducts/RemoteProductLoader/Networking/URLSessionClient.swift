//
//  URLSessionClient.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 23/11/23.
//

import Foundation

public final class URLSessionClient: HTTPClient {
    private var session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func request<T: Codable>(router: RouterProtocol) async -> Result<T, NetworkError> {
        guard let url = URL(string: "\(router.baseURL + router.path)") else { return .failure(NetworkError.invalidURL)}
            var request = URLRequest(url: url)
            switch router.httpMethod {
            case .get(let params):
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components?.queryItems = params
                guard let url = components?.url else { return .failure(NetworkError.invalidURL)}
                request = URLRequest(url: url)
            }
            request.httpMethod = router.httpMethod.name
            request.allHTTPHeaderFields = router.headers
            request.timeoutInterval = Double.infinity
        do {
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse, ((response.statusCode == 200)) else { throw NetworkError.invalidResponse  }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return .success(result)
            } catch {
                return .failure(NetworkError.decodingError)
            }

        } catch {
            return .failure(NetworkError.connectivityError)
        }
    }
}
