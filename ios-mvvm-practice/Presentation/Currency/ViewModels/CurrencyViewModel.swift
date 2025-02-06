//
//  CurrencyViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class CurrencyViewModel {
    
    //MAKR: - Input
    let amountText: Observable<String?> = Observable(nil)
    let convertButtonTapped: Observable<Void> = Observable(())
    
    //MAKR: - Output
    let resultText: Observable<String?> = Observable(nil)
    let convertValidation = Observable(false)
    
    //MAKR: - Property
    private var amount: Double?
    
    //MAKR: - Initializer Method
    init() {
        amountText.bind { [weak self] amount in
            self?.validation(of: amount)
        }
        
        convertButtonTapped.lazyBind { [weak self] _ in
            self?.convert()
        }
    }
    
    //MAKR: - Method
    private func validation(of amountText: String?) {
        self.amount = nil
        
        guard let amountText else {
            resultText.value = "환전 결과가 여기에 표시됩니다."
            convertValidation.value = false
            return
        }
        
        guard !amountText.isEmpty else {
            resultText.value = "환전 결과가 여기에 표시됩니다."
            convertValidation.value = false
            return
        }
        
        guard let amount = Double(amountText) else {
            resultText.value = "올바른 금액을 입력해주세요."
            convertValidation.value = false
            return
        }
        
        guard  0 < amount && amount <= 10000000000 else {
            resultText.value = "0 ~ 100억 달러 사이의 원화 금액을 입력해주세요."
            convertValidation.value = false
            return
        }
        
        resultText.value = "환전 결과가 여기에 표시됩니다."
        convertValidation.value = true
        self.amount = amount
    }
    
    private func convert() {
        guard let amount else {
            resultText.value = "올바른 금액을 입력해주세요."
            convertValidation.value = true
            return
        }
        
        let exchangeRate = 1350.0  // 실제 환율 데이터로 대체 필요
        let convertedAmount = amount / exchangeRate
        resultText.value = String(format: "%.2f USD (약 $%.2f)", convertedAmount, convertedAmount)
    }
    
}
