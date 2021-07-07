//
//  UICollectionView.swift
//  Directory
//
//  Created by Cole Roberts on 2/22/21.
//

import UIKit

extension UICollectionView {
    public func dequeueCell<T: UICollectionViewCellIdentifiable>(of type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifer, for: indexPath) as? T {
            return cell
        }
    
        fatalError("Unable to create cell with type \(type)")
    }
}
