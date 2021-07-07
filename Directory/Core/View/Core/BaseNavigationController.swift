//
//  BaseNavigationController.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import UIKit

public final class BaseNavigationController: UINavigationController {
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.rounded(size: 17, weight: .bold)
        ]
        
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.rounded(size: 34, weight: .bold)
        ]
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
