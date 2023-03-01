//
//  ViewController.swift
//  TableViewLearning
//
//  Created by Vitali Martsinovich on 2023-02-27.
//

import UIKit

class FavouritesVC: UIViewController {
    
    private let favoriteView = FavouritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame.width)
        view.backgroundColor = .secondarySystemBackground
        favoriteView.recipesTableView.dataSource = self
        favoriteView.recipesTableView.delegate = self
        setupView()
    }
    
    
    private func setupView() {
        view.addSubview(favoriteView)
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoriteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoriteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension FavouritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! CustomHeader
        view.title.text = "Favourites"
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        cell.isChecked = false
        cell.favouriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

