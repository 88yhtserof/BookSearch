//
//  BookSearchResponse.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

struct BookSearchResponse: Decodable {
    let total: Int
    let start: Int
    let display: Int
    let items: [BookSummary]
}
