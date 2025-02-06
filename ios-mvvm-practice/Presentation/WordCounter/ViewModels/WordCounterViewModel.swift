//
//  WordCounterViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class WordCounterViewModel {
    
    //MAKR: - Input
    let textViewText: Observable<String?> = Observable(nil)
    let countText: Observable<String?> = Observable(nil)
    
    //MAKR: - Output
    private let count = Observable(0)
    
    //MAKR: - Initializer Method
    init() {
        textViewText.bind { [weak self] text in
            self?.counting(of: text)
        }
        
        count.bind { [weak self] count in
            self?.countText.value = "현재까지 \(count)글자 작성중"
        }
    }
    
    //MAKR: - Method
    private func counting(of text: String?) {
        guard let text else {
            count.value = 0
            return
        }
        
        count.value = text.count
    }
    
}
