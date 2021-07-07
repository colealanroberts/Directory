//
//  AlertViewController.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit

public final class AlertViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let alertTitle: String
    private let message: String
    
    // MARK: - UI
    
    private lazy var alertView: UIView = {
        let av = UIView(frame: .zero)
        av.layer.cornerRadius = 8
        av.layer.cornerCurve = .continuous
        av.backgroundColor = .systemBackground
        
        return av
    }()
    
    private lazy var backgroundView: UIView = {
        let bgv = UIView(frame: .zero)
        bgv.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        return bgv
    }()
    
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
    
    public init(title: String, message: String) {
        self.alertTitle = title
        self.message = message
        
        super.init(nibName: nil, bundle: nil)
        constructView()
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
        
        titleLabel.text = title
        messageLabel.text = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func constructView() {
        view.addSubview(backgroundView)
        backgroundView.pinToSuperviewEdges()
        
        view.addSubview(alertView)
        alertView.center()
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        alertView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            
            // Alert
            alertView.heightAnchor.constraint(equalToConstant: 140),
            alertView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            alertView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
            // Stackview
            stackView.centerYAnchor.constraint(equalTo: alertView.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 24),
            stackView.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -24)
        ])
    }
}
