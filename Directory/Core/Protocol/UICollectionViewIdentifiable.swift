//
//  UICollectionViewIdentifiable.swift
//  Directory
//
//  Created by Cole Roberts on 2/22/21.
//

import UIKit

public protocol UICollectionViewCellIdentifiable: UICollectionViewCell {
    static var reuseIdentifer: String { get set }
}
