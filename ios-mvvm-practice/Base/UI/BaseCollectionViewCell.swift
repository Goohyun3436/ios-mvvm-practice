//
//  BaseCollectionViewCell.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, setupView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        setupAttributes()
    }
    
    func setupUI() {}
    
    func setupConstraints() {}
    
    func setupAttributes() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
