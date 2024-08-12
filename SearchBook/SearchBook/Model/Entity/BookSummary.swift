//
//  BookSummary.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import Foundation

struct BookSummary: Hashable, Decodable {
    let isbn: Int
    let title: String
    let image: String
    let author: String
}

#if DEBUG
extension BookSummary {
    static let sample = [
        BookSummary(isbn: 0, title: "오만과 편견", image: "https://shopping-phinf.pstatic.net/main_3245596/32455966292.20230801121405.jpg?type=w300", author: "제인 오스틴"),
        BookSummary(isbn: 1, title: "All the Beauty in the World", image: "https://shopping-phinf.pstatic.net/main_3863986/38639861626.20240521070916.jpg?type=w300", author: "Patrick Bringley"),
        BookSummary(isbn: 2, title: "데미안", image: "https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788954620147.jpg", author: "헤르만 헤세"),
        BookSummary(isbn: 3, title: "모순", image: "https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788998441012.jpg", author: "양귀자")
    ]
}
#endif
