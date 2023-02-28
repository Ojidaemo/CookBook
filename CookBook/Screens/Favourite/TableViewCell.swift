//
//  TableViewCell.swift
//  CookBook
//
//  Created by Vitali Martsinovich on 2023-02-27.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let recipeName: UILabel = {
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
    
    let recipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "tableImage")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let favouriteButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func favouriteButtonPressed() {
        if favouriteButton.currentBackgroundImage == UIImage(systemName: "heart") {
            favouriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favouriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        }
        print("pressed")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(recipeImage)
        self.addSubview(recipeName)
        contentView.addSubview(favouriteButton)
        
        
        NSLayoutConstraint.activate([
            
            recipeImage.topAnchor.constraint(equalTo: self.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            recipeImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recipeImage.widthAnchor.constraint(equalToConstant: self.frame.width / 2 + 10),
            
            recipeName.topAnchor.constraint(equalTo: self.topAnchor),
            recipeName.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor),
            recipeName.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 30),
            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
            favouriteButton.topAnchor.constraint(equalTo: recipeImage.topAnchor),
            favouriteButton.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor,constant: 5)
            
        ])
    }

}
