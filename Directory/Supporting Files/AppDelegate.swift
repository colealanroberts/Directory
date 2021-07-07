//
//  AppDelegate.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = BaseNavigationController(rootViewController: HomeViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

