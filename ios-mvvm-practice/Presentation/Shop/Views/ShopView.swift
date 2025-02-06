//
//  ShopView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit
import SnapKit

final class ShopView: BaseView {
    
    //MARK: - UI Property
    let searchBar = UISearchBar()
    let statusLabel = UILabel()
    
    //MARK: - Configure Method
    override func setupUI() {
        [searchBar, statusLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom).offset(100)
        }
    }
    
    override func setupAttributes() {
        statusLabel.text = "쇼핑하구팡"
        
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [.foregroundColor: UIColor.gray])
        searchBar.setImage(UIImage(systemName: "xmark.circle.fill"), for: .clear, state: .normal)
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.searchTextField.leftView?.tintColor = UIColor.lightGray
        searchBar.tintColor = UIColor.white
    }
    
}
