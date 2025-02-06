//
//  ShopCollectionView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

class ShopCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            
            let inset: CGFloat = 16
            let spacing: CGFloat = 16
            let cellPerRow: CGFloat = 2
            let width: CGFloat = (UIScreen.main.bounds.width - inset * 2 - spacing * (cellPerRow - 1)) / cellPerRow
            let height: CGFloat = width * 1.6
            
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: width, height: height)
            layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            
            return layout
        }())
        
        register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
