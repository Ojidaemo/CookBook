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
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.favoriteView.recipesTableView.reloadData()
        }
        print("!!!!!!!! Показываем избранное в который раз !!!!!!!!!!")
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
        return PreloadData.favoriteRecips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        cell.liked = true
//        cell.favouriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        let recipe = PreloadData.favoriteRecips[indexPath.row]
        if PreloadData.favoriteRecips.contains(recipe) {
            //cell.liked = true
            cell.favouriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            //cell.liked = false
            cell.favouriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        }
        cell.configure(recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .white
        bgColorView.layer.cornerRadius = 15
        cell.selectedBackgroundView = bgColorView
        let vc = DetailedRecipeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

