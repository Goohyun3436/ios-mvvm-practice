//
//  ShopViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

final class ShopViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = ShopView()
    
    //MARK: - UI Property
    private let viewModel = ShopViewModel()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.searchBar.delegate = self
        setupBinds()
    }
    
    //MARK: - Setup Method
    private func setupBinds() {
        viewModel.outputSearchBarCancelShow.lazyBind { isShow in
            self.mainView.searchBar.setShowsCancelButton(isShow, animated: true)
        }
        
        viewModel.outputSearchBarCancelButtonTapped.lazyBind { _ in
            self.mainView.searchBar.text = ""
            self.view.endEditing(true)
        }
        
        viewModel.outputQuery.lazyBind { query in
            let vc = ShopDetailViewController()
            vc.query = query
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

//MARK: - UISearchBarDelegate
extension ShopViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.inputSearchBarCancelShow.value = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.inputSearchButtonTapped.value = searchBar.text
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.inputSearchBarCancelButtonTapped.value = ()
        viewModel.inputSearchBarCancelShow.value = false
    }
    
}
