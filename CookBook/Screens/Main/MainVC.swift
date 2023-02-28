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
    var isSelected = false
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setUpCollectionViewUI()
    }
    
    private func setupView() {
        view.addSubview(collectionView)
    }
}
private func setupUICell(cell: UICollectionViewCell, color: UIColor) {
    cell.backgroundColor = color
    cell.layer.borderWidth = 0.0
    cell.layer.shadowColor = UIColor.black.cgColor
    cell.layer.shadowOffset = CGSize(width: 0, height: 3)
    cell.layer.shadowRadius = 3.0
    cell.layer.shadowOpacity = 0.7
    cell.layer.masksToBounds = false //<-
    cell.layer.cornerRadius = 15
}
extension MainVC {
    /// Adds the `UICollectionView`to the view
    fileprivate func setUpCollectionViewUI() {
        cellWidth = view.frame.width/6
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: cellWidth),
            collectionView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
//MARK: - UICollectionViewDelegate
extension MainVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.lastIndexActive != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
            setupUICell(cell: cell, color: .lightGray)
            
            if let cell1 = collectionView.cellForItem(at: self.lastIndexActive) as? CategoryCell {
                setupUICell(cell: cell1, color: .white)
            }
            self.lastIndexActive = indexPath
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

