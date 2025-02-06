//
//  ShopDetailViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import UIKit

class ShopDetailViewController: UIViewController {
    
    //MARK: - Property
    var query: String? {
        didSet {
            if let query {
                callRequest(query)
                navigationItem.title = query
            }
        }
    }
    let fixDisplay = 30
    lazy var display = fixDisplay
    var sort = Sort.sim {
        didSet {
            guard sort != oldValue else {
                return
            }
            
            if query != nil {
                isEnd = false
                display = fixDisplay
                start = 1
                mainView.sortButtonStackView.changeButtonColors(selected: sort)
            }
        }
    }
    var start: Int = 1 {
        didSet {
            if let query {
                callRequest(query)
            }
        }
    }
    var total: Int = 0 {
        didSet {
            mainView.totalLabel.text = "\(total.formatted()) 개의 검색 결과"
        }
    }
    var list = [ShopItem]() {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    var isEnd: Bool = false
    
    //MARK: - UI Property
    let mainView = ShopDetailView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSortButtons()
        configureCollectionView()
    }
    
    //MARK: - Method
    func callRequest(_ query: String) {
        NetworkManager.shared.shop(.search(query, display, start, sort.rawValue), Shop.self, completionHandler: { data in
            if self.start == 1 {
                self.total = data.total
                self.list = data.items
                self.mainView.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            } else {
                self.list.append(contentsOf: data.items)
            }
        }, failureHandler: { err in
            print(">>", err)
        })
    }
    
    @objc func sortButtonTapped(_ sender: UIButton) {
        let button = sender as! SortButton
        sort = button.sort
    }
    
    //MARK: - Configure Method
    func configureSortButtons() {
        for item in mainView.sortButtonStackView.buttons {
            item.addTarget(self, action: #selector(sortButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    func configureCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
    }
    
}

//MARK: - UICollectionView
extension ShopDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.id, for: indexPath) as! ShopCollectionViewCell
        
        let row = list[indexPath.item]
        
        cell.configureData(row)
        
        return cell
    }
    
}

extension ShopDetailViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        guard !isEnd else {
            return
        }
        
        for item in indexPaths {
            guard list.count - 2 == item.row else {
                return
            }
            
            guard display > 0 else {
                return
            }
            
            let holding = display * start
            let remain = total - holding
            
            guard display < remain else {
                display = remain
                start = holding + 1
                isEnd = true
                return
            }
            
            start += 1
        }
    }
    
}
