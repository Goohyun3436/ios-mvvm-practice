//
//  CurrencyViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class CurrencyViewModel {
    
    var amountText: Observable<String?> = Observable(nil)
    var convertButtonTapped: Observable<Void> = Observable(())
    var resultText: Observable<String?> = Observable(nil)
    
    init() {
        amountText.bind { amount in
            self.validation(of: amount)
        }
        
        convertButtonTapped.lazyBind { _ in
            print("convertButtonTapped")
        }
    }
    
    private func validation(of amountText: String?) {
        guard let amountText else {
            resultText.value = "환전 결과가 여기에 표시됩니다."
            return
        }
    }
    
}
