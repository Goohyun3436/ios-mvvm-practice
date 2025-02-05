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
    @objc private func amountTextFieldDidChanged() {
        viewModel.amountText.value = mainView.amountTextField.text
    }
    
    @objc private func convertButtonTapped() {
        viewModel.convertButtonTapped.value = ()
    }
    
    //MARK: - Setup Method
    private func setupActions() {
        mainView.amountTextField.addTarget(
            self,
            action: #selector(amountTextFieldDidChanged),
            for: .editingChanged
        )
        
        mainView.convertButton.addTarget(
            self,
            action: #selector(convertButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupBinds() {
        viewModel.convertValidation.bind { validation in
            self.mainView.convertButton.backgroundColor = validation
                ? UIColor.white
                : UIColor.darkGray
        }
        
        viewModel.resultText.bind { text in
            self.mainView.resultLabel.text = text
        }
    }
    
}
