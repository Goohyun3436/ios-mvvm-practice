//
//  ShopResponse.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

//MARK: - Response
struct Shop: Decodable {
    let total: Int
    let items: [ShopItem]
}

struct ShopItem: Decodable {
    let image: String
    let mallName: String
    let title: String
    let lprice: String
    
    var titleToPainText: String {
        return title.toPlainText()
    }
}

//MARK: - Error
struct ShopErrorResponse: Decodable {
    let errorCode: String
    let errorMessage: String
}

enum ShopError: String {
    case incorrect_query_request = "SE01"
    case invalid_display_value = "SE02"
    case invalid_start_value = "SE03"
    case malformed_encoding = "SE04"
    case invalid_search_api = "SE05"
    case system_error = "SE99"
    case unowned = "SE00"
    
    init(_ errorCode: String) {
        switch errorCode {
        case "SE01":
            self = .incorrect_query_request
        case "SE02":
            self = .invalid_display_value
        case "SE03":
            self = .invalid_start_value
        case "SE04":
            self = .malformed_encoding
        case "SE05":
            self = .invalid_search_api
        case "SE99":
            self = .system_error
        default:
            self = .unowned
        }
    }
    
    var statusCode: Int {
        switch self {
        case .incorrect_query_request,
                .invalid_display_value,
                .invalid_start_value,
                .malformed_encoding:
            return 400
        case .invalid_search_api:
            return 404
        case .system_error:
            return 500
        case .unowned:
            return 0
        }
    }
    
    var title: String {
        return "실패"
    }
    
    var message: String {
        return "\(self.description) (\(self.rawValue))"
    }
    
    private var description: String {
        switch self {
        case .incorrect_query_request,
                .invalid_display_value,
                .invalid_start_value,
                .malformed_encoding,
                .invalid_search_api:
            return "잘못된 요청입니다."
        case .system_error:
            return "네이버 쇼핑 서버 내부에 오류가 발생했습니다."
        case .unowned:
            return "Movie Pedia 내부에 오류가 발생했습니다."
        }
    }
}
