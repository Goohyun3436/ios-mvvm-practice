//
//  WordCountView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit
import SnapKit

final class WordCountView: BaseView {
    
    //MARK: - UI Property
    let textView = UITextView()
    let countLabel = UILabel()
    
    //MARK: - Setup Method
    override func setupUI() {
        [textView, countLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(textView.snp.width)
        }
    }
    
    override func setupAttributes() {
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.cornerRadius = 8
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.keyboardAppearance = UIKeyboardAppearance.dark
        
        countLabel.textAlignment = .left
        countLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
}
