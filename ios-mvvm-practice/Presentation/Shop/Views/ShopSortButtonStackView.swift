//
//  ShopSortButtonStackView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit
import SnapKit

class SortButton: UIButton {
    
    //MARK: - Property
    var sort = Sort.sim
    
    init(_ type: Sort) {
        super.init(frame: .zero)
        
        let isActive = sort == type
        
        self.sort = type
        setTitle(type.title, for: .normal)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        configureColor(isActive)
    }
    
    func configureColor(_ isActive: Bool) {
        backgroundColor = isActive ? UIColor.white : UIColor.black
        setTitleColor(isActive ? UIColor.black : UIColor.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ShopSortButtonStackView: UIStackView {
    
    //MARK: - UI Property
    let buttons = [
        SortButton(Sort.sim),
        SortButton(Sort.date),
        SortButton(Sort.dsc),
        SortButton(Sort.asc)
    ]
    
    //MARK: - Override Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttons.forEach {
            addArrangedSubview($0)
            
            $0.snp.makeConstraints { make in
                make.height.equalTo(30)
            }
        }
        
        axis = .horizontal
        spacing = 8
    }
    
    //MARK: - Configure Method
    func changeButtonColors(selected: Sort) {
        buttons.forEach {
            $0.configureColor($0.sort == selected)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
