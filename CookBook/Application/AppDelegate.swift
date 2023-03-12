//
//  AppDelegate.swift
//  CookBook
//
//  Created by Alexandr Rodionov on 25.02.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PreloadData.favoriteRecips = DataStorage.shared.loadData(key: "favorite")
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        DataStorage.shared.saveData(dataToSave: PreloadData.favoriteRecips)
    }
}
