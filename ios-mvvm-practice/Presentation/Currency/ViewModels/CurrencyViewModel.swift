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
    let result: Observable<CurrencyResult> = Observable(.empty)
    
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
            result.value = .empty
            return
        }
        
        guard !amountText.isEmpty else {
            result.value = .empty
            return
        }
        
        guard let amount = Double(amountText) else {
            result.value = .not_numeric
            return
        }
        
        guard  0 < amount && amount <= 10000000000 else {
            result.value = .out_of_range
            return
        }
        
        result.value = .ready
        self.amount = amount
    }
    
    private func convert() {
        guard let amount else {
            result.value = .not_numeric
            return
        }
        
        result.value = .success(amount)
    }
    
}
