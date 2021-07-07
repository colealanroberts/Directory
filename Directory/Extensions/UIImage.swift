//
//  UIImage.swift
//  Directory
//
//  Created by Cole Roberts on 2/22/21.
//

import UIKit
import func AVFoundation.AVMakeRect

extension UIImage {
    
    // MARK: - Helper Properties
    
    /// Returns an image suitable for placeholder content
    public func placeholder() -> UIImage? {
        return image(with: CGSize(width: 60, height: 60), color: .systemGray5)
    }
    
    /// Creates a UIImage with the specified size and color
    public func image(with size: CGSize, color: UIColor) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { ctx in
            ctx.cgContext.setFillColor(color.cgColor)
            ctx.cgContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    /// Resizes a UIImage to the given CGSize
    public func resize(in view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        
        return renderer.image { ctx in
            draw(in: AVMakeRect(aspectRatio: size, insideRect: view.bounds))
        }
    }
}

