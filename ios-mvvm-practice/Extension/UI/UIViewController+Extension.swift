//
//  UIViewController+Extension.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

extension UIViewController {
    
    func presentAlert(_ title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
