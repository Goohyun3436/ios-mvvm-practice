//
//  ShopDetailView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit
import SnapKit

class ShopDetailView: BaseView {
    
    //MARK: - UI Property
    let totalLabel = UILabel()
    let sortButtonStackView = ShopSortButtonStackView()
    let collectionView = ShopCollectionView()
    
    override func setupUI() {
        [totalLabel, sortButtonStackView, collectionView].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        sortButtonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(totalLabel.snp.bottom).offset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(sortButtonStackView.snp.bottom).offset(8)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func setupAttributes() {
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
    }
    
}
