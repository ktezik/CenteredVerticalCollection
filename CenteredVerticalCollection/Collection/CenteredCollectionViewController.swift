//
//  CenteredCollectionViewController.swift
//  CenteredVerticalCollection
//
//  Created by Иван Гришин on 15.09.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class CenteredCollectionViewController: UICollectionViewController {

    let model: [Int] = {
        var array: [Int] = []
        for _ in 0...14 {
            array.append(Int.random(in: 60...154))
        }
        return array
    }()
    
    // MARK: - Private Properties
    
    private let layout: UICollectionViewCenterLayout = {
        let layout = UICollectionViewCenterLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        return layout
    }()
    
    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - UICollectionViewDataSource

extension CenteredCollectionViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        cell.backgroundColor = .gray
    
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CenteredCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let item = model[indexPath.item]
        return CGSize(width: item, height: 40)
    }
    
}
