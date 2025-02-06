//
//  ShopDetailViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation
import Alamofire

final class ShopDetailViewModel {
    
    //MARK: - Input
    let inputQuery: Observable<String?> = Observable(nil)
    let inputSortButtonTapped: Observable<Sort> = Observable(.sim)
    let inputPreFetchTrigger: Observable<[IndexPath]> = Observable([])
    let inputPopVC: Observable<Void?> = Observable(nil)
    
    //MARK: - Output
    let outputNavigationTitle = Observable("")
    let outputSortButtonTapped: Observable<Sort> = Observable(.sim)
    let outputTotalText = Observable("")
    let outputShopItems: Observable<[ShopItem]> = Observable([])
    let outputScrollToTop: Observable<Void?> = Observable(nil)
    let outputNetworkError: Observable<ShopError?> = Observable(nil)
    let outputError: Observable<SearchError?> = Observable(nil)
    let outputPopVC: Observable<Void?> = Observable(nil)
    
    //MARK: - Property
    private var query: String? {
        didSet {
            self.getShopItems()
            self.outputNavigationTitle.value = query ?? ""
        }
    }
    private let fixDisplay: Int = 30
    private lazy var display: Int = fixDisplay
    private var start: Int = 1 {
        didSet {
            getShopItems()
        }
    }
    private var sort = Sort.sim
    private var total: Int = 0 {
        didSet {
            outputTotalText.value = "\(total.formatted()) 개의 검색 결과"
        }
    }
    private var isEnd: Bool = false
    
    //MARK: - Initializer Method
    init() {
        inputQuery.lazyBind { query in
            self.query = query
        }
        
        inputSortButtonTapped.lazyBind { sort in
            guard self.sort != sort else { return }
            
            self.sort = sort
            
            guard self.query != nil else { return }
            
            self.display = self.fixDisplay
            self.start = 1
            
            self.outputSortButtonTapped.value = self.sort
        }
        
        inputPreFetchTrigger.lazyBind { indexPaths in
            self.prefetchItemsAt(indexPaths)
        }
        
        inputPopVC.lazyBind { _ in
            self.outputPopVC.value = ()
        }
    }
    
    //MARK: - Method
    private func getShopItems() {
        guard let query = self.query else { return }
        
        NetworkManager.shared.shop(.search(query, display, start, sort.rawValue), Shop.self, completionHandler: { data in
            if self.start == 1 {
                self.total = data.total
                self.outputShopItems.value = data.items
                
                guard self.total > 0 else {
                    self.outputError.value = .emptyData
                    return
                }
                
                self.outputScrollToTop.value = ()
            } else {
                self.outputShopItems.value.append(contentsOf: data.items)
            }
        }, failureHandler: { err in
            self.outputNetworkError.value = err
        })
    }
    
    private func prefetchItemsAt(_ indexPaths: [IndexPath]) {
        guard !isEnd else {
            return
        }
        
        indexPaths.forEach {
            guard outputShopItems.value.count - 2 == $0.row else {
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
