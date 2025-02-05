//
//  CurrencyViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = CurrencyView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
