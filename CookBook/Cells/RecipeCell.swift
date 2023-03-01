//
//  RecipeCell.swift
//  CookBook
//
//  Created by Лерочка on 28.02.2023.
//

import UIKit

class RecipeCell: UITableViewCell {
    static let identifier = "RecipeCell"
    var isChecked = true
    private let recipeName: UILabel = {
        let label = UILabel()
        label.text = "Grilled Fish With Sun Dried Tomato Relish"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recipeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tableImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
     lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func favouriteButtonPressed() {
        
        if isChecked {
            favouriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            isChecked = false
        } else {
            favouriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            isChecked = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        contentView.addSubview(recipeImage)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(recipeName)
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            recipeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            recipeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            recipeImage.widthAnchor.constraint(equalToConstant: self.frame.width / 2 + 10),
            
            recipeName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            recipeName.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor),
            recipeName.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 30),
            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
            favouriteButton.topAnchor.constraint(equalTo: recipeImage.topAnchor),
            favouriteButton.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor,constant: 5)
            
        ])
    }
}

