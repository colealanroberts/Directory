//
//  DiffableAdapter.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import UIKit


// MARK: - Section

private enum Section {
    case list
}

extension Section: CaseIterable {}

// MARK: - DiffableAdapter

public final class DiffableAdapter {
    
    // MARK: - Public Properties
    
    public var data = [AnyHashable]() {
        didSet {
            performUpdates()
        }
    }
    
    /// Controls whether or not the backing
    /// `NSDiffableDataSourceSnapshot` applies snapshots
    /// with an animation
    public var animateDifferences: Bool = true
    
    // MARK: - Private Properties
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { [weak self] (collectionView, indexPath, object) -> UICollectionViewCell? in
        return self?.cell(for: indexPath)
    }
    
    private let collectionView: UICollectionView
    
    // MARK: - Init
    
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    // MARK: - Public Methods

    /// Registers each cell passed in to the collectionView by calling
    /// the `register:cellClass:forCellWithReuseIdentifier:` method on UICollectionView
    public func register(cells: [UICollectionViewCellIdentifiable.Type]) {
        cells.forEach {
            collectionView.register($0.self, forCellWithReuseIdentifier: $0.reuseIdentifer)
        }
    }
    
    // MARK: - Private Methods
    
    private func performUpdates() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
            snapshot.appendSections(Section.allCases)
            snapshot.appendItems(self.data, toSection: .list)
            
            self.dataSource.apply(snapshot, animatingDifferences: self.animateDifferences)
        }
    }
    
    private func cell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let model = data[indexPath.row] as? EmployeeModel {
            let cell = collectionView.dequeueCell(of: EmployeeCollectionViewCell.self, for: indexPath)
            cell.configure(with: model)
            
            return cell
        }
        
        if let _ = data[indexPath.row] as? EmptyResultModel {
            return collectionView.dequeueCell(of: EmptyResultCollectionViewCell.self, for: indexPath)
        }
        
        if let _ = data[indexPath.row] as? ActivityIndicatorModel {
            return collectionView.dequeueCell(of: ActivityIndicatorCollectionViewCell.self, for: indexPath)
        }
        
        fatalError()
    }
}
