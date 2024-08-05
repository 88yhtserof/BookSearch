//
//  BookSummaryListCell.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import UIKit

class BookSummaryListCell: UICollectionViewCell {
    var bookSummary: BookSummary?
    
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
        imageVew.contentMode = .scaleToFill
        
        [ imageVew, titleLabel, authorLabel ]
            .forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
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
            .forEach{ contentView.addSubview($0) }
        
        let interImageSpacing = CGFloat(5)
        let interLabelSpacing = CGFloat(3)
        
        NSLayoutConstraint.activate([
            imageVew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageVew.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageVew.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageVew.bottomAnchor, constant: interImageSpacing),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: interLabelSpacing),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
