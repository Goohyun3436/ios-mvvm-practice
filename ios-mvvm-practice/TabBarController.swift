//
//  TabBarController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

private enum TabBar: String, CaseIterable {
    case currency
    case wordCounter
    case user
    
    var vc: UIViewController.Type {
        switch self {
        case .currency:
            return CurrencyViewController.self
        case .wordCounter:
            return WordCounterViewController.self
        case .user:
            return UserViewController.self
        }
    }
    
    var title: String {
        switch self {
        case .currency:
            return "환율 계산기"
        case .wordCounter:
            return "글자수 계산기"
        case .user:
            return "사용자 목록 관리"
        }
    }
    
    var icon: String {
        switch self {
        case .currency:
            return "dollarsign.circle"
        case .wordCounter:
            return "text.word.spacing"
        case .user:
            return "person.crop.circle"
        }
    }
}

final class TabBarController: UITabBarController {
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        configureTBC()
    }
    
    //MARK: - Method
    private func configureTBC() {
        let tabs = TabBar.allCases
        var navs = [UINavigationController]()
        
        for item in tabs {
            navs.append(makeNav(item))
        }
        
        setViewControllers(navs, animated: true)
    }
    
    private func makeNav(_ tab: TabBar) -> UINavigationController {
        let vc = tab.vc.init()
        let nav = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = tab.title
        nav.tabBarItem.image = UIImage(systemName: tab.icon, withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 16, weight: .bold)))
        nav.tabBarItem.title = tab.rawValue.uppercased()
        return nav
    }
}

