//
//  BaseView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

protocol setupView {
    func setupUI()
    func setupConstraints()
    func setupAttributes()
}

class BaseView: UIView, setupView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        setupAttributes()
    }
    
    func setupUI() {}
    
    func setupConstraints() {}
    
    func setupAttributes() {}
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
