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
        let appearanceT = UITabBarAppearance()
        appearanceT.configureWithTransparentBackground()
        appearanceT.backgroundColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().standardAppearance = appearanceT
        UITabBar.appearance().scrollEdgeAppearance = appearanceT
        
        let appearanceN = UINavigationBarAppearance()
        appearanceN.configureWithTransparentBackground()
        appearanceN.backgroundColor = UIColor.black
        appearanceN.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearanceN.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().standardAppearance = appearanceN
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceN
        
        BaseView.appearance().backgroundColor = UIColor.black
        
        UILabel.appearance().textColor = UIColor.white
        
        UIButton.appearance().setTitleColor(UIColor.black, for: .normal)
        
        UITextField.appearance().tintColor = UIColor.white
        UITextField.appearance().textColor = UIColor.white
        UITextField.appearance().backgroundColor = UIColor.black
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark
        
        UITextView.appearance().tintColor = UIColor.white
        UITextView.appearance().textColor = UIColor.white
        UITextView.appearance().backgroundColor = UIColor.black
        
        UISearchBar.appearance().barTintColor = UIColor.black
        UISearchBar.appearance().keyboardAppearance = UIKeyboardAppearance.dark
        UISearchTextField.appearance().tintColor = UIColor.lightGray
        UISearchTextField.appearance().backgroundColor = UIColor.deepGray
        
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().separatorColor = UIColor.darkGray
        UITableView.appearance().indicatorStyle = .black
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        UICollectionView.appearance().backgroundColor = UIColor.clear
    }
}
