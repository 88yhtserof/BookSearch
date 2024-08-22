//
//  BookSearchService.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

class BookSearchService: BookSearchServiceProtocol {
    private let networkManager = NetworkManager()
    private let api = BookSearchAPI()
    
    /// Downloads a contents of URL with a search word and return a array of BookSummary decoded from data.
    func searchBooks(with word: String) async throws -> [BookSummary] {
        let components = api.searchBooks(with: word)
        guard let request = networkManager.configureHTTPRequest(to: components, type: .get) else {
            throw HTTPError.failedToConfigureRequest
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw HTTPError.invalidRequest
        }
        
        let decoded = try JSONDecoder().decode(BookSearchResponse.self, from: data)
        return decoded.items
    }
}
