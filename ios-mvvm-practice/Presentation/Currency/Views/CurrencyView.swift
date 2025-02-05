//
//  CurrencyView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit
import SnapKit

final class CurrencyView: BaseView {
    
    //MARK: - UI Property
    private let exchangeRateLabel = UILabel()
    private let amountTextField = UITextField()
    private let convertButton = UIButton(type: .system)
    private let resultLabel = UILabel()
    
    //MARK: - Setup Method
    override func setupUI() {
        exchangeRateLabel.text = "현재 환율: 1 USD = 1,350 KRW"
        amountTextField.placeholder = "원화 금액을 입력하세요"
        convertButton.setTitle("환전하기", for: .normal)
        resultLabel.text = "환전 결과가 여기에 표시됩니다"
        
        [exchangeRateLabel, amountTextField, convertButton, resultLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        exchangeRateLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        amountTextField.snp.makeConstraints { make in
            make.top.equalTo(exchangeRateLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        convertButton.snp.makeConstraints { make in
            make.top.equalTo(amountTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(convertButton.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    override func setupAttributes() {
        exchangeRateLabel.textAlignment = .center
        exchangeRateLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        amountTextField.keyboardType = .numberPad
        amountTextField.borderStyle = .roundedRect
        amountTextField.layer.cornerRadius = 8
        amountTextField.layer.borderWidth = 1
        amountTextField.layer.borderColor = UIColor.gray.cgColor
        amountTextField.textAlignment = .center
        amountTextField.attributedPlaceholder = NSAttributedString(string: amountTextField.placeholder ?? "", attributes: [.foregroundColor: UIColor.gray])
        
        convertButton.layer.cornerRadius = 8
        convertButton.backgroundColor = UIColor.white
        convertButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
}
