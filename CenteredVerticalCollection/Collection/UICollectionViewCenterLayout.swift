//
//  UICollectionViewCenterLayout.swift
//  CenteredVerticalCollection
//
//  Created by Иван Гришин on 16.09.2022.
//

import UIKit

/// Layout коллекции с центрированием
final class UICollectionViewCenterLayout: UICollectionViewFlowLayout {
    
    // MARK: - Override Methods
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }

        var rows = [CollectionViewRow]()
        var currentRowY: CGFloat = -1

        for attribute in attributes {
            if currentRowY != attribute.frame.midY {
                currentRowY = attribute.frame.midY
                rows.append(CollectionViewRow(spacing: 10))
            }
            rows.last?.add(attribute: attribute)
        }

        rows.forEach { $0.centerLayout(collectionViewWidth: collectionView?.frame.width ?? 0) }
        return rows.flatMap { $0.attributes }
    }
}
