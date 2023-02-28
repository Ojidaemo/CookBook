//
//  CategoryView.swift
//  CookBook
//
//  Created by Лерочка on 28.02.2023.
//

import UIKit

final class RecipeView: UIView {
    
    var categories = ["all", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
    var cellWidth: CGFloat = 0
    var isSelected = true
    var lastIndexActive:IndexPath = [1 ,0]
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .secondarySystemBackground
        return collectionView
    }()
    
    lazy var recipesTableView: UITableView = {
        let recipesTableView = UITableView()
        recipesTableView.rowHeight = 180
        recipesTableView.layer.cornerRadius = 10
        recipesTableView.translatesAutoresizingMaskIntoConstraints = false
        return recipesTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        recipesTableView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        recipesTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        addSubviews(recipesTableView, collectionView)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        cellWidth = self.frame.width/6
        print(cellWidth)
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: 430),
            collectionView.heightAnchor.constraint(equalToConstant: 72),
            collectionView.centerYAnchor.constraint(equalTo: topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            recipesTableView.widthAnchor.constraint(equalToConstant: 430),
            recipesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27),
            recipesTableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            recipesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            recipesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
}
