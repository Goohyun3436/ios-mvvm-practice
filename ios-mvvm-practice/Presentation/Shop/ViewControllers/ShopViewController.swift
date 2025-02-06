//
//  ShopViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

final class ShopViewController: UIViewController {
    
    //MARK: - UI Property
    let mainView = ShopView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.searchBar.delegate = self
    }
    
}

//MARK: - UISearchBarDelegate
extension ShopViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var text = searchBar.text else {
            return
        }
        
        text = text.trimmingCharacters(in: .whitespaces)
        
        guard !text.isEmpty else {
//            SearchAlert(SearchError.emptyQuery)
            return
        }
        
        guard text.count >= 2 else {
//            SearchAlert(SearchError.shortQuery)
            return
        }
        
        let vc = ShopDetailViewController()
        vc.query = mainView.searchBar.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
}
