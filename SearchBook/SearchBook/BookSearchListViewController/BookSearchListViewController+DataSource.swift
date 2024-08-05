//
//  BookSearchListViewController+DataSource.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import UIKit

extension BookSearchListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, BookSummary>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, BookSummary>
    
    func cellRegistrationHandler(cell: BookSummaryListCell, indexPath: IndexPath, item: BookSummary) {
        cell.bookSummary = item
    }
    
    func updateSnapshot() {
        let item = BookSummary.sample
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(item)
        dataSource.apply(snapshot)
    }
}
