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
    
    //MARK: - Property
    private let viewModel = CurrencyViewModel()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupBinds()
    }
    
    //MARK: - Method
    @objc private func convertButtonTapped() {
        viewModel.convertButtonTapped.value = ()
    }
    
    //MARK: - Setup Method
    private func setupActions() {
        mainView.convertButton.addTarget(
            self,
            action: #selector(convertButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupBinds() {
        viewModel.resultText.bind { text in
            self.mainView.resultLabel.text = text
        }
    }
    
}
