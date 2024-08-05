//
//  BookSummaryListCell.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import UIKit

class BookSummaryListCell: UICollectionViewCell {
    var bookSummary: BookSummary?
    
    private lazy var stack = UIStackView()
    private lazy var imageVew = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var authorLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureSubviews()
        configureContentView()
    }
}

private extension BookSummaryListCell {
    func configureSubviews() {
        stack.axis = .vertical
        stack.spacing = CGFloat(10)
        imageVew.contentMode = .scaleToFill
        imageVew.backgroundColor = .systemGray6
        
        guard let bookSummary = self.bookSummary else {
            fatalError("The bookSummary property has no value yet")
        }
        
        titleLabel.text = bookSummary.title
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        authorLabel.text = bookSummary.author
        authorLabel.font = .systemFont(ofSize: 10, weight: .light)
    }
    
    func configureContentView() {
        [ imageVew, titleLabel, authorLabel ]
            .forEach{ stack.addArrangedSubview($0) }
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
