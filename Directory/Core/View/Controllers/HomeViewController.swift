//
//  HomeViewController.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
 
    private lazy var fetchController: FetchController<EmployeeModel> = {
        let fc = FetchController<EmployeeModel>()
        fc.delegate = self
        
        return fc
    }()
    
    // MARK: - UI
    
    private lazy var adapter: DiffableAdapter = {
        let adapter = DiffableAdapter(collectionView: collectionView)
        
        adapter.register(cells: [
            EmployeeCollectionViewCell.self,
            EmptyResultCollectionViewCell.self,
            ActivityIndicatorCollectionViewCell.self
        ])
        
        return adapter
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: BaseCollectionViewFlowLayout())
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        cv.backgroundColor = .systemGroupedBackground
        cv.alwaysBounceVertical = true
        
        return cv
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        constructView()
        
        // Simulated delay of 1 seconds prior
        // to making network request to show loading indicator
        fetchController.delegate = self
        fetchController.fetch()
    }
    
    // MARK: - Private Methods
    
    private func constructView() {
        title = NSLocalizedString("Team", comment: "Team")
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(collectionView)
        collectionView.pinToSuperviewSafeArea()
    }
}

// MARK: - FetchControllerDelegate

extension HomeViewController: FetchControllerDelegate {
    func fetchControllerDidUpdate<T>(_ fetchController: FetchController<T>, from fromState: FetchControllerState, error: Error?) {
                
        if let error = error {
            let alertViewController = AlertViewController(
                title: NSLocalizedString("An error occurred", comment: "Generic error message"),
                message: error.localizedDescription
            )

            self.present(alertViewController, animated: true, completion: nil)
            return
        }

        var data = [AnyHashable]()
        
        if fetchController.state == .fetching {
            data.append(ActivityIndicatorModel())
        }
        
        if fetchController.state == .complete {
            if fetchController.data.isEmpty {
                data.append(EmptyResultModel())
            } else {
                data.append(contentsOf: fetchController.data)
            }
        }
        
        adapter.data = data
    }
}
