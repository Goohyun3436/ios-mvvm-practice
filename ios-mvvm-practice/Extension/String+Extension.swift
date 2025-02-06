//
//  String+Extension.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

extension String {
    func toPlainText() -> String {
        self.replacingOccurrences(of: #"<[^>]+>"#, with: "", options: .regularExpression)
    }
}
