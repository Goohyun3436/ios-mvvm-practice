//
//  AppAppearance.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

final class AppAppearance {
    
    private init() {}
    
    static func setUpAppearance() {
        BaseView.appearance().backgroundColor = UIColor.white
        
        UILabel.appearance().textColor = UIColor.black
        
        UIButton.appearance().setTitleColor(UIColor.white, for: .normal)
        
        UITextField.appearance().tintColor = UIColor.black
        UITextField.appearance().textColor = UIColor.black
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.light
        
        UITextView.appearance().tintColor = UIColor.black
        UITextView.appearance().textColor = UIColor.black
        UITextView.appearance().keyboardAppearance = UIKeyboardAppearance.light
        
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().separatorColor = UIColor.tertiarySystemBackground
        UITableView.appearance().indicatorStyle = .white
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }
}
