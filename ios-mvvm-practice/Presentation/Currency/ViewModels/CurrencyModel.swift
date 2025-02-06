//
//  CurrencyModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/7/25.
//

import Foundation

enum CurrencyResult {
    case success(_ amount: Double)
    case ready
    case empty
    case not_numeric
    case out_of_range
    
    var validation: Bool {
        switch self {
        case .success, .ready:
            return true
        case .empty, .not_numeric, .out_of_range:
            return false
        }
    }
    
    var message: String {
        switch self {
        case .success(let amount):
            return exchange(amount)
        case .ready, .empty:
            return "환전 결과가 여기에 표시됩니다."
        case .not_numeric:
            return "올바른 금액을 입력해주세요."
        case .out_of_range:
            return "0 ~ 100억 달러 사이의 원화 금액을 입력해주세요."
        }
    }
    
    private func exchange(_ amount: Double) -> String {
        let exchangeRate = 1350.0  // 실제 환율 데이터로 대체 필요
        let convertedAmount = amount / exchangeRate
        let result = String(format: "%.2f USD (약 $%.2f)", convertedAmount, convertedAmount)
        return result
    }
}
