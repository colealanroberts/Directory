//
//  ActivityIndicatorCollectionViewCell.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit

public class ActivityIndicatorCollectionViewCell: UICollectionViewCell, UICollectionViewCellIdentifiable {
    
    // MARK: - Identifier

    public static var reuseIdentifer: String = "ActivityIndicatorCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .medium)
    }()
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        constructView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func constructView() {
        contentView.addSubview(indicatorView)
        indicatorView.center()
        indicatorView.startAnimating()
    }
}
