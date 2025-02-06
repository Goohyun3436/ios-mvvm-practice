//
//  Sort.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

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

enum Sort: String {
    case sim, date, asc, dsc
    
    var title: String {
        switch self {
        case .sim:
            return "정확도"
        case .date:
            return "날짜순"
        case .dsc:
            return "가격높은순"
        case .asc:
            return "가격낮은순"
        }
    }
}
