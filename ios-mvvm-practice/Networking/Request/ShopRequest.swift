//
//  ShopRequest.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation
import Alamofire

enum ShopRequest {
    case search(_ query: String, _ display: Int, _ start: Int, _ sort: String)
    
    var endpoint: String {
        return APIUrl.naver + self.path
    }
    
    private var path: String {
        switch self {
        case .search:
            return "/search/shop.json"
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .search(let query, let display, let start, let sort):
            return [
                "query": query,
                "display": display,
                "start": start,
                "sort": sort
            ]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return [
            "X-Naver-Client-Id": APIKey.naverClientId,
            "X-Naver-Client-Secret": APIKey.naverClientSecret
        ]
    }
}
