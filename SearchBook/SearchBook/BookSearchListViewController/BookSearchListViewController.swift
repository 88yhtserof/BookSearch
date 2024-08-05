//
//  BookSearchListViewController.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/4/24.
//

import UIKit

class BookSearchListViewController: UIViewController {
    
    private lazy var searchBar = UISearchBar()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuraSubviews()
        configureView()
    }
}

//MARK: - Configuration
private extension BookSearchListViewController {
    func configuraSubviews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        navigationItem.titleView = searchBar
        
        let verticalInset = CGFloat(10)
        let horizontalInset = CGFloat(10)
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalInset).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset).isActive = true
    }
}

//MARK: - CollectionView Layout
private extension BookSearchListViewController {
    func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.interItemSpacing = .flexible(5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = CGFloat(15)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
