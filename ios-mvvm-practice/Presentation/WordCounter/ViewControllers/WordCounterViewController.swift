//
//  WordCounterViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

class WordCounterViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = WordCountView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
