//
//  UIFont.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import UIKit

extension UIFont {
    class func rounded(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: size)
        }
        
        SQAssert(false, "The font descriptor was unable to created.")
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
