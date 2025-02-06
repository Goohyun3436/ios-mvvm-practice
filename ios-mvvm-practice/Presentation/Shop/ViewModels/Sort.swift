//
//  Sort.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

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
