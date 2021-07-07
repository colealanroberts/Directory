//
//  BaseCollectionViewFlowLayout.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit

public final class BaseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    public override init() {
        super.init()
        
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
