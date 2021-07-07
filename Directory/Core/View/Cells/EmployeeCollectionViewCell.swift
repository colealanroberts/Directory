//
//  EmployeeCollectionViewCell.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import UIKit
import Kingfisher

public final class EmployeeCollectionViewCell: UICollectionViewCell, UICollectionViewCellIdentifiable {
    
    // MARK: - Identifier
    
    public static var reuseIdentifer: String = "EmployeeCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rounded(size: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.backgroundColor = contentView.backgroundColor
        
        return label
    }()
    
    private lazy var teamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rounded(size: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.backgroundColor = contentView.backgroundColor
        
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 26.0
        iv.layer.cornerCurve = .continuous
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(avatarImageView)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, teamLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            // Image
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            // Stackview
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    // MARK: - Lifecycle
    
    public override func prepareForReuse() {
        nameLabel.text = nil
        teamLabel.text = nil
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure(with model: EmployeeModel) {
        SQAssertMainThread()
        
        nameLabel.text = model.fullName
        teamLabel.text = model.team

        if let photoURL = model.photoUrlSmall, let url = URL(string: photoURL) {
            avatarImageView.kf.setImage(
                with: url,
                placeholder: UIImage().placeholder(),
                options: [
                    .forceTransition
                ]
            )
        }
    }
}
