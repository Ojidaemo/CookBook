//
//  MainVC.swift
//  CookBook
//
//  Created by Alexandr Rodionov on 26.02.23.
//

import UIKit

class MainVC: UIViewController {
    var categories = ["all", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
    //MARK: - Private properties
    
    var cellWidth: CGFloat = 0
    var isSelected = true
    var lastIndexActive:IndexPath = [1 ,0]
    
    // MARK: - SubViews
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var recipesTableView: UITableView = {
        let recipesTableView = UITableView()
        recipesTableView.translatesAutoresizingMaskIntoConstraints = false
        recipesTableView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier)
        recipesTableView.dataSource = self //Отвечает за данные
        recipesTableView.delegate = self //Отвечает за поведение
        recipesTableView.register(CustomHeader.self,
              forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        return recipesTableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstrains()
    }
    
    private func setupView() {
        view.addSubview(collectionView)
        view.addSubview(recipesTableView)
    }
}
private func setupUICell(cell: UICollectionViewCell, color: UIColor) {
    cell.backgroundColor = color
    cell.layer.borderWidth = 0.0
    cell.layer.shadowColor = UIColor.black.cgColor
    cell.layer.shadowOffset = CGSize(width: 0, height: 3)
    cell.layer.shadowRadius = 3.0
    cell.layer.shadowOpacity = 0.7
    cell.layer.masksToBounds = false
    cell.layer.cornerRadius = 15
}
extension MainVC {
    fileprivate func setupConstrains() {
        cellWidth = view.frame.width/6
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: cellWidth),
            collectionView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            recipesTableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            recipesTableView.heightAnchor.constraint(equalToConstant: view.frame.height - 100),
            recipesTableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}
//MARK: - UICollectionViewDelegate
extension MainVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath)
        isSelected = false
        if self.lastIndexActive != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
            setupUICell(cell: cell, color: .lightGray)

            if let cell1 = collectionView.cellForItem(at: self.lastIndexActive) as? CategoryCell {
                setupUICell(cell: cell1, color: .white)
            }
            self.lastIndexActive = indexPath
        }
    }
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         if isSelected && indexPath == [0,0]{
             setupUICell(cell: cell, color: .lightGray)
             isSelected = false
             self.lastIndexActive = [0,0]
         }
    }
}

//MARK: - UICollectionViewDataSource
extension MainVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        setupUICell(cell: cell, color: .white)
        let category = categories[indexPath.row]
        cell.configure(with: category)
        
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.categories[indexPath.row]
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize: 14.0)]).width + 20.0
        return CGSize(width: cellWidth, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) //отступы от секции
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {

     func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "Recipes"

       return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

