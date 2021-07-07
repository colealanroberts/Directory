//
//  EmptyResultCollectionViewCell.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit

public class EmptyResultCollectionViewCell: UICollectionViewCell, UICollectionViewCellIdentifiable {
    
    // MARK: - Identifier

    public static var reuseIdentifer: String = "EmptyResultCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rounded(size: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rounded(size: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        contentView.addSubview(stackView)
        stackView.center()
        
        titleLabel.text = NSLocalizedString("Dang, it's lonely here.", comment: "Dang, it's lonely here.")
        messageLabel.text = NSLocalizedString("Your lovely coworkers will appear here.", comment: "Your lovely coworkers will appear here.")
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
    }
}
