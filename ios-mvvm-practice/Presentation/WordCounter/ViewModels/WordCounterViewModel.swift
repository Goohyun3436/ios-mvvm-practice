//
//  WordCounterViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class WordCounterViewModel {
    
    var textViewText: Observable<String?> = Observable(nil)
    var countText: Observable<String?> = Observable(nil)
    private var count = Observable(0)
    
    init() {
        textViewText.bind { text in
            self.counting(of: text)
        }
        
        count.bind { count in
            self.countText.value = "현재까지 \(count)글자 작성중"
        }
    }
    
    private func counting(of text: String?) {
        guard let text else {
            count.value = 0
            return
        }
        
        count.value = text.count
    }
    
}
