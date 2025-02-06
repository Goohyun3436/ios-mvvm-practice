//
//  ShopCollectionViewCell.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit
import Kingfisher
import SnapKit

class ShopCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - UI Property
    let wrapView = UIStackView()
    let imageView = UIImageView()
    let mallNameLabel = UILabel()
    let titleLabel = UILabel()
    let lpriceLabel = UILabel()
    
    //MARK: - Property
    static let id = "ShopCollectionViewCell"
    
    //MARK: - Configure Method
    func configureData(_ row: ShopItem) {
        let url = URL(string: row.image)
        imageView.kf.setImage(with: url)
        
        mallNameLabel.text = row.mallName
        
        titleLabel.text = row.titleToPainText
        
        lpriceLabel.text = Int(row.lprice)?.formatted()
    }
    
    override func setupUI() {
        contentView.addSubview(wrapView)
        
        [imageView, mallNameLabel, titleLabel, lpriceLabel].forEach {
            wrapView.addArrangedSubview($0)
        }
    }
    
    override func setupConstraints() {
        wrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(contentView)
        }
        wrapView.axis = .vertical
        wrapView.spacing = 4
        wrapView.alignment = .center
        wrapView.distribution = .fill
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(wrapView.snp.width).multipliedBy(1.0 / 1.0)
        }
        
        let inset = 8
        
        mallNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
        }
        
        lpriceLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
            make.height.equalTo(24)
        }
    }
    
    override func setupAttributes() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        
        mallNameLabel.textColor = UIColor.gray
        mallNameLabel.font = UIFont.systemFont(ofSize: 12)
        
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        titleLabel.textColor = UIColor.lightGray
        
        lpriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
}
