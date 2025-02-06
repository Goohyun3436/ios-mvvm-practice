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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.amountTextField.becomeFirstResponder()
    }
    
    //MARK: - Method
    @objc private func mainViewTapped() {
        mainView.amountTextField.resignFirstResponder()
    }
    
    @objc private func amountTextFieldDidChanged() {
        viewModel.amountText.value = mainView.amountTextField.text
    }
    
    @objc private func convertButtonTapped() {
        viewModel.convertButtonTapped.value = ()
        mainView.amountTextField.resignFirstResponder()
    }
    
    //MARK: - Setup Method
    private func setupActions() {
        let singleTap = UITapGestureRecognizer(
            target: self,
            action: #selector(mainViewTapped)
        )
        mainView.addGestureRecognizer(singleTap)
        mainView.isUserInteractionEnabled = true
        
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
        viewModel.result.bind { [weak self] result in
            self?.mainView.resultLabel.text = result.message
            
            self?.mainView.convertButton.backgroundColor = result.validation
                ? UIColor.white
                : UIColor.gray
        }
    }
    
}
