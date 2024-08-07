//
//  BookSummaryListCell.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import UIKit

class BookSummaryListCell: UICollectionViewCell {
    var bookSummary: BookSummary?
    private let imageLoader = ImageLoader()
    
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

//MARK: - Configuration
private extension BookSummaryListCell {
    func configureSubviews() {
        stack.axis = .vertical
        stack.spacing = CGFloat(10)
        imageVew.contentMode = .scaleToFill
        imageVew.backgroundColor = .systemGray6
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        authorLabel.font = .systemFont(ofSize: 10, weight: .light)
        
        guard let bookSummary = self.bookSummary else {
            fatalError("The bookSummary property has no value yet")
        }
        titleLabel.text = bookSummary.title
        authorLabel.text = bookSummary.author
        if let url = URL(string: bookSummary.image) {
            Task{ try await configureImage(url) }
        }
    }
    
    func configureImage(_ url: URL) async throws {
        do {
            let image = try await imageLoader.loadImage(from: url)
            imageVew.image = image
        } catch let error as ImageLoadError {
            print("ERROR:", error.localizedDescription)
        }
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
