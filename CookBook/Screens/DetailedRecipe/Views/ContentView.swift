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
        imageView.image = UIImage(named: "tableImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Grilled Fish With Sun Dried Tomato Relish"
        label.numberOfLines = 2
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
        label.text = "15 min"
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
        label.text = "Белки "
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
        label.text = "Углеводы "
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
        label.text = "Жиры "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeStackView = UIStackView()
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
        label.text = " • gergger\n • ergergverrv\n • werf wef3\n • erf3frv3rv\n • edfcv3v "
        label.numberOfLines = 0
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
        label.text = "Кокосовый бисквит сможет испечь даже начинающий кулинар: при взбивании можно не бояться, что тесто осядет, так как для подстраховки добавляется рахрыхлитель. Кокосовый бисквит получается более плотным, чем классический, и это позволяет не только без труда разрезать его на ровные коржи для торта, но и использовать в качестве основы для муссовых и желейных десертов."
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 40
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
    
//    public func configure(_ recipe: Result) {
//
//        self.dishImageView.sd_setImage(with: URL(string: recipe.image))
//        self.titleLabel.text = recipe.title
//        self.ingredientsInfoLabel.text = recipe.
//         layoutSubviews()
//     }
    
    public func configure(_ recipe: Recipe) {
      
        self.dishImageView.sd_setImage(with: URL(string: recipe.image))
        self.titleLabel.text = recipe.title
         layoutSubviews()
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
        
        macronutrientsStackView = UIStackView(arrangedSubviews: [squirrelsView,
                                                                 carbohydratesView,
                                                                 fatsView])
        macronutrientsStackView.axis = .horizontal
        macronutrientsStackView.spacing = 37
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
            dishImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -100),
            dishImageView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 25),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            timeStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            timeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            
            macronutrientsStackView.topAnchor.constraint(equalTo: timeStackView.bottomAnchor, constant: 20),
            macronutrientsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
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
            
            cookingMethodLabel.topAnchor.constraint(equalTo: ingredientsInfoLabel.bottomAnchor, constant: 50),
            cookingMethodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            cookingMethodTextLabel.topAnchor.constraint(equalTo: cookingMethodLabel.bottomAnchor, constant: 20),
            cookingMethodTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            cookingMethodTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
