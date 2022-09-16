//
//  CollectionViewRow.swift
//  CenteredVerticalCollection
//
//  Created by Иван Гришин on 16.09.2022.
//

import UIKit

/// Класс принимающий Layout Attributes и рассчитывающий ширину и центрирующий ячейки
final class CollectionViewRow {
    
    // MARK: - Public Properties
    
    /// Layout Attributes
    var attributes = [UICollectionViewLayoutAttributes]()
    /// Расстояние между ячейками
    var spacing: CGFloat = 0
    /// Расчет ширины
    var rowWidth: CGFloat {
        return attributes.reduce(0, { result, attribute -> CGFloat in
            return result + attribute.frame.width
        }) + CGFloat(attributes.count - 1) * spacing
    }
    
    // MARK: - Initializer
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }

    // MARK: - Public Methods
    
    /// Добавляем атрибуты коллекции
    func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }

    /// Центрируем коллекцию
    func centerLayout(collectionViewWidth: CGFloat) {
        let padding = (collectionViewWidth - rowWidth) / 2
        var offset = padding
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + spacing
        }
    }
}
