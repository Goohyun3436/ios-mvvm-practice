//
//  UserViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

final class UserViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = UserView()
    
    //MARK: - Property
    private var viewModel = UserViewModel()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        setupActions()
        setupBinds()
    }
    
    //MARK: - Method
    @objc private func loadButtonTapped() {
        viewModel.loadButtonTapped.value = ()
    }
    
    @objc private func resetButtonTapped() {
        viewModel.resetButtonTapped.value = ()
    }
    
    @objc private func addButtonTapped() {
        viewModel.addButtonTapped.value = ()
    }
    
    //MARK: - Setup Method
    private func setupActions() {
        mainView.loadButton.addTarget(
            self,
            action: #selector(loadButtonTapped),
            for: .touchUpInside
        )
        
        mainView.resetButton.addTarget(
            self,
            action: #selector(resetButtonTapped),
            for: .touchUpInside
        )
        
        mainView.addButton.addTarget(
            self,
            action: #selector(addButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupBinds() {
        viewModel.people.lazyBind { [weak self] _ in
            self?.mainView.tableView.reloadData()
        }
    }
    
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.people.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = viewModel.people.value[indexPath.row]
        cell.textLabel?.text = "\(person.name), \(person.age)세"
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
}
