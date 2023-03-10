//
//  TabBarVC.swift
//  CookBook
//
//  Created by Лерочка on 27.02.2023.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    // Генерируем контроллеры на таббаре с помощью доп. метода
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: SearchVC(),
                title: "Search",
                image: UIImage(named: "Search"),
                selectedImage: UIImage(named: "SearchSelected")
            ),
            generateVC(
                viewController: MainVC(),
                title: "Home",
                image: UIImage(named: "Category"),
                selectedImage: UIImage(named: "CategorySelected")
            ),
            generateVC(
                viewController: FavouritesVC(),
                title: "Favourites",
                image: UIImage(named: "Favourite"),
                selectedImage: UIImage(named: "FavouriteSelected")
            )
        ]
    }
    
    // Метод создания первоначального контроллера
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.selectedImage = selectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        return viewController
    }
    
    private func setTabBarAppearance() {
        selectedIndex = 1 // Стартуем с экрана номер 2
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
