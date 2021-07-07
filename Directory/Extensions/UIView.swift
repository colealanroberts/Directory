//
//  UIView.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit

extension UIView {
    public func center(in containingView: UIView) {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: containingView.safeAreaLayoutGuide.centerYAnchor),
            centerXAnchor.constraint(equalTo: containingView.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    public func center() {
        guard let superview = superview else { return }
        
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        center(in: superview)
    }
    
    public func pinToSuperviewSafeArea() {
        guard let superview = superview else { return }
        
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor),
            rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    public func pinToSuperviewEdges() {
        guard let superview = superview else { return }
        
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            rightAnchor.constraint(equalTo: superview.rightAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leftAnchor.constraint(equalTo: superview.leftAnchor)
        ])
    }
}
