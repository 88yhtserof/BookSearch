//
//  BookSearchAPI.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

struct BookSearchAPI {
    private var url = ConfigurationManager.shared.bookSearchAPIRequestURL
    
    /// Configure a components of URL with a search word and return the components, Or nil if you fail to construct the components using a url.
    func searchBooks(with word: String) -> URLComponents? {
        guard let url = self.url,
              var components = URLComponents(string: url) else {
            return nil
        }
        
        let queryItems = [
            URLQueryItem(name: "query", value: word),
            URLQueryItem(name: "display", value: "10"),
            URLQueryItem(name: "start", value: "1")
        ]
        components.queryItems = queryItems
        return components
    }
}
