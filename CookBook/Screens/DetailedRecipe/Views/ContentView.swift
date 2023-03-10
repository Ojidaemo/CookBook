//
//  ContentView.swift
//  CookBook
//
//  Created by KODDER on 01.03.2023.
//

import UIKit
import SDWebImage

class ContentView: UIView {
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dishIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "fork.knife")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dishLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let squirrelsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 90).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let squirrelsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let carbohydratesView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 90).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let carbohydratesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 90).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let fatsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var timeStackView = UIStackView()
    var dishTypeStackView = UIStackView()
    var macronutrientsStackView = UIStackView()
    
    private let mainIngredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Main ingredients"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TODO: Add Ingredients
    let ingredientsInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 40
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cookingMethodLabel: UILabel = {
        let label = UILabel()
        label.text = "Cooking method"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cookingMethodTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ recipe: [Recipe]) {
        guard let image = recipe.last?.image,
              let title = recipe.last?.title,
              let cookingTime = recipe.last?.readyInMinutes,
              let dishType = recipe.last?.dishTypes,
              let method = recipe.last?.instructions,
              let ingredients = recipe.last?.extendedIngredients else { return }
        
        var finalString = ""
        for ingredient in ingredients {
            if let textInfo = ingredient.original {
                finalString += "• \(textInfo)\n"
            }
            
            DispatchQueue.main.async {
                self.dishImageView.sd_setImage(with: URL(string: image))
                self.titleLabel.text = title
                self.timeLabel.text = "\(cookingTime) min"
                self.dishLabel.text = "\(dishType[0])"
                self.cookingMethodTextLabel.text = "\(method.htmlToString)"
                self.ingredientsInfoLabel.text = finalString
                self.squirrelsLabel.text = "Protein: \(Int.random(in: 15...50))g"
                self.carbohydratesLabel.text = "Carbs: \(Int.random(in: 25...90))g"
                self.fatsLabel.text = "Fat: \(Int.random(in: 30...70))g"
            }
            layoutSubviews()
            layoutIfNeeded()
        }
    }
    
    private func setupView() {
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dishImageView)
        addSubview(titleLabel)
        
        timeStackView = UIStackView(arrangedSubviews: [timeImageView,
                                                       timeLabel])
        timeStackView.axis = .horizontal
        timeStackView.spacing = 5
        timeStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeStackView)
        
        dishTypeStackView = UIStackView(arrangedSubviews: [dishIconImageView,
                                                           dishLabel])
        dishTypeStackView.axis = .horizontal
        dishTypeStackView.spacing = 5
        dishTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dishTypeStackView)
        
        macronutrientsStackView = UIStackView(arrangedSubviews: [squirrelsView,
                                                                 carbohydratesView,
                                                                 fatsView])
        macronutrientsStackView.axis = .horizontal
        macronutrientsStackView.spacing = 20
        macronutrientsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(macronutrientsStackView)
        
        squirrelsView.addSubview(squirrelsLabel)
        carbohydratesView.addSubview(carbohydratesLabel)
        fatsView.addSubview(fatsLabel)
        
        addSubview(mainIngredientsLabel)
        addSubview(ingredientsInfoLabel)
        addSubview(cookingMethodLabel)
        addSubview(cookingMethodTextLabel)
    }
}

extension ContentView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dishImageView.topAnchor.constraint(equalTo: topAnchor),
            dishImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -15),
            dishImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 25),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            timeStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            timeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            
            dishTypeStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dishTypeStackView.leadingAnchor.constraint(equalTo: timeStackView.trailingAnchor, constant: 50),
            
            macronutrientsStackView.topAnchor.constraint(equalTo: timeStackView.bottomAnchor, constant: 20),
            macronutrientsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            squirrelsLabel.centerXAnchor.constraint(equalTo: squirrelsView.centerXAnchor),
            squirrelsLabel.centerYAnchor.constraint(equalTo: squirrelsView.centerYAnchor),
            carbohydratesLabel.centerXAnchor.constraint(equalTo: carbohydratesView.centerXAnchor),
            carbohydratesLabel.centerYAnchor.constraint(equalTo: squirrelsView.centerYAnchor),
            fatsLabel.centerXAnchor.constraint(equalTo: fatsView.centerXAnchor),
            fatsLabel.centerYAnchor.constraint(equalTo: fatsView.centerYAnchor),
            
            mainIngredientsLabel.topAnchor.constraint(equalTo: macronutrientsStackView.bottomAnchor, constant: 20),
            mainIngredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            ingredientsInfoLabel.topAnchor.constraint(equalTo: mainIngredientsLabel.bottomAnchor, constant: 20),
            ingredientsInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            ingredientsInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            cookingMethodLabel.topAnchor.constraint(equalTo: ingredientsInfoLabel.bottomAnchor, constant: 20),
            cookingMethodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            cookingMethodTextLabel.topAnchor.constraint(equalTo: cookingMethodLabel.bottomAnchor, constant: 20),
            cookingMethodTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            cookingMethodTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}
