//
//  UIViewController+Extension.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

extension UIViewController {
    
    func presentAlert(_ title: String?, _ message: String?, completionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler?()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
