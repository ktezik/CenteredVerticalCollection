//
//  ViewController.swift
//  CenteredVerticalCollection
//
//  Created by Иван Гришин on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = CenteredCollectionViewController(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add collection
        view.addSubview(collectionView.view)
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.view.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                constant: -40
            ),
            collectionView.view.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                constant: -300
            ),
        ])
    }


}

