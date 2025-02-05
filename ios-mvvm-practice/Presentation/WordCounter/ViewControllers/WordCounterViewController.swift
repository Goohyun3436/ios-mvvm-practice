//
//  WordCounterViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

final class WordCounterViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = WordCountView()
    
    //MARK: - Property
    private let viewModel = WordCounterViewModel()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupBinds()
    }
    
    private func setupActions() {
        mainView.textView.delegate = self
    }
    
    private func setupBinds() {
        viewModel.countText.bind { text in
            self.mainView.countLabel.text = text
        }
    }
    
}

//MARK: - UITextViewDelegate
extension WordCounterViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.textViewText.value = textView.text
    }
    
}
