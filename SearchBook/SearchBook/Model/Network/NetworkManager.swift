//
//  NetworkManager.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        self.rawValue
    }
}

enum HTTPError: Error {
    case failedToConfigureRequest
    case invalidRequest
    case systemError
    case decodingFailed
    
}

struct NetworkManager {
    private var clientID = ConfigurationManager.shared.clientID
    private var clientSecret = ConfigurationManager.shared.clientSecret
    
    /// Configure a request for HTTP with a specified components and return the request.
    func configureHTTPRequest(to components: URLComponents?, type httpMethod: HTTPMethod) -> URLRequest? {
        guard let url = components?.url,
              let clientID = clientID,
              let clientSecret = clientSecret else {
            return nil
        }
        
        var httpRequest = URLRequest(url: url)
        httpRequest.httpMethod = httpMethod.name
        httpRequest.setValue("X-Naver-Client-Id", forHTTPHeaderField: clientID)
        httpRequest.setValue("X-Naver-Client-Secret", forHTTPHeaderField: clientSecret)
        
        return httpRequest
    }
}
