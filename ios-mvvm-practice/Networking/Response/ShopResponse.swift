//
//  ShopResponse.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation

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
