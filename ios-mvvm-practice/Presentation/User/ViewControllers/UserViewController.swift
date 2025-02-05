//
//  UserViewController.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import UIKit

struct Person {
    let name: String
    let age: Int
}

final class UserViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = UserView()
    
    //MARK: - Property
    private var people: [Person] = [
        Person(name: "name1", age: 1),
        Person(name: "name2", age: 2)
    ]
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = people[indexPath.row]
        cell.textLabel?.text = "\(person.name), \(person.age)세"
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
}
