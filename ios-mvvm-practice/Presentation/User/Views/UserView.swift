//
//  UserView.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit
import SnapKit

final class UserView: BaseView {
    
    //MARK: - UI Property
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [loadButton, resetButton, addButton])
    private let loadButton = UIButton(type: .system)
    private let resetButton = UIButton(type: .system)
    private let addButton = UIButton(type: .system)
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")
        return table
    }()
    
    //MARK: - Setup Method
    override func setupUI() {
        loadButton.setTitle("Load", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        addButton.setTitle("Add", for: .normal)
        
        [buttonStackView, tableView].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        buttonStackView.distribution = .fillEqually
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func setupAttributes() {
        loadButton.backgroundColor = UIColor.systemBlue
        resetButton.backgroundColor = UIColor.systemRed
        addButton.backgroundColor = UIColor.systemGreen
        
        [loadButton, resetButton, addButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 8
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    
}
