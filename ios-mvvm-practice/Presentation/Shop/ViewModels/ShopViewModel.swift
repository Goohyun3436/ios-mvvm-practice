//
//  ShopViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

final class ShopViewModel {
    
    enum SearchError {
        case emptyQuery, shortQuery
        
        var title: String {
            switch self {
            case .emptyQuery:
                return "검색 실패"
            case .shortQuery:
                return "검색 실패"
            }
        }
        
        var message: String {
            switch self {
            case .emptyQuery:
                return "검색어를 입력해주세요"
            case .shortQuery:
                return "검색어를 2글자 이상 입력해주세요"
            }
        }
    }
    
    //MARK: - Property
    let inputSearchBarCancelShow = Observable(false)
    let inputSearchBarCancelButtonTapped: Observable<Void?> = Observable(nil)
    let inputSearchButtonTapped: Observable<String?> = Observable(nil)
    
    let outputSearchBarCancelShow = Observable(false)
    let outputSearchBarCancelButtonTapped: Observable<Void?> = Observable(nil)
    let outputSearchError: Observable<SearchError?> = Observable(nil)
    let outputQuery = Observable("")
    
    //MARK: - Initializer Meth
    init() {
        inputSearchBarCancelShow.lazyBind { isShow in
            self.outputSearchBarCancelShow.value = isShow
        }
        
        inputSearchBarCancelButtonTapped.lazyBind { _ in
            self.outputSearchBarCancelButtonTapped.value = ()
        }
        
        inputSearchButtonTapped.lazyBind { query in
            self.validation(query)
        }
    }
    
    //MARK: - Method
    private func validation(_ query: String?) {
        guard var query else {
            outputSearchError.value = .emptyQuery
            return
        }
        
        query = query.trimmingCharacters(in: .whitespaces)
        
        guard !query.isEmpty else {
            outputSearchError.value = .emptyQuery
            return
        }
        
        guard query.count >= 2 else {
            outputSearchError.value = .shortQuery
            return
        }
        
        outputQuery.value = query
    }
    
}
