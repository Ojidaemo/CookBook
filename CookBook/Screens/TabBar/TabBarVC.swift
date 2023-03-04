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
                image: UIImage(systemName: "magnifyingglass.circle"),
                selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
            ),
            generateVC(
                viewController: MainVC(),
                title: "Home",
                image: UIImage(systemName: "house"),
                selectedImage: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: FavouritesVC(),
                title: "Favourites",
                image: UIImage(systemName: "heart"),
                selectedImage: UIImage(systemName: "heart.fill")
            )
        ]
    }
    
    // Метод создания первоначального контроллера
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
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
