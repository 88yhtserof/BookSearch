//
//  BookSearchServiceProtocol.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

protocol BookSearchServiceProtocol {
    func searchBooks(with word: String) async throws -> [BookSummary]
}
