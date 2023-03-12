//
//  FavouritesView.swift
//  CookBook
//
//  Created by Лерочка on 01.03.2023.
//

import UIKit

final class FavouritesView: UIView {
   
    var isSelected = true
    
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
        recipesTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        addSubviews(recipesTableView)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            recipesTableView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            recipesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27),
            recipesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            recipesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
}
