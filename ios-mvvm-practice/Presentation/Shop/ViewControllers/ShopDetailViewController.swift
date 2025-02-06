//
//  ShopDetailViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

final class ShopDetailViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = ShopDetailView()
    
    //MARK: - Property
    let viewModel = ShopDetailViewModel()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
        setupActions()
        setupBinds()
    }
    
    //MARK: - Method
    @objc private func sortButtonTapped(_ sender: UIButton) {
        let button = sender as! SortButton
        viewModel.inputSortButtonTapped.value = button.sort
    }
    
    //MARK: - Setup Method
    private func setupActions() {
        for item in mainView.sortButtonStackView.buttons {
            item.addTarget(self, action: #selector(sortButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    private func setupBinds() {
        viewModel.outputNavigationTitle.lazyBind { [weak self] title in
            self?.title = title
        }
        
        viewModel.outputSortButtonTapped.lazyBind { [weak self] sort in
            self?.mainView.sortButtonStackView.changeButtonColors(selected: sort)
        }
        
        viewModel.outputTotalText.lazyBind { [weak self] text in
            self?.mainView.totalLabel.text = text
        }
        
        viewModel.outputShopItems.lazyBind { [weak self] _ in
            self?.mainView.collectionView.reloadData()
        }
        
        viewModel.outputScrollToTop.lazyBind { [weak self] _ in
            self?.mainView.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }
        
        viewModel.outputNetworkError.lazyBind { [weak self] err in
            guard let err else { return }
            self?.presentAlert(err.title, err.message) {
                self?.viewModel.inputPopVC.value = ()
            }
        }
        
        viewModel.outputError.lazyBind { [weak self] err in
            guard let err else { return }
            self?.presentAlert(err.title, err.message) {
                self?.viewModel.inputPopVC.value = ()
            }
        }
        
        viewModel.outputPopVC.lazyBind { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
}

//MARK: - UICollectionView
extension ShopDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputShopItems.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.id, for: indexPath) as! ShopCollectionViewCell
        
        let row = viewModel.outputShopItems.value[indexPath.item]
        cell.configureData(row)
        
        return cell
    }
    
}

extension ShopDetailViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        viewModel.inputPreFetchTrigger.value = indexPaths
    }
    
}
