//
//  UserViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class UserViewModel {
    
    struct Person {
        let name: String
        let age: Int
    }
    
    var people: Observable<[Person]> = Observable([])
    var loadButtonTapped: Observable<Void> = Observable(())
    var resetButtonTapped: Observable<Void> = Observable(())
    var addButtonTapped: Observable<Void> = Observable(())
    
    init() {
        loadButtonTapped.lazyBind { _ in
            self.loadPerson()
        }
        
        resetButtonTapped.lazyBind { _ in
            self.resetPerson()
        }
        
        addButtonTapped.lazyBind { _ in
            self.addPerson()
        }
    }
    
    private func loadPerson() {
        people.value = [
            Person(name: "James", age: Int.random(in: 20...70)),
            Person(name: "Mary", age: Int.random(in: 20...70)),
            Person(name: "John", age: Int.random(in: 20...70)),
            Person(name: "Patricia", age: Int.random(in: 20...70)),
            Person(name: "Robert", age: Int.random(in: 20...70))
        ]
    }
    
    private func resetPerson() {
        people.value.removeAll()
    }
    
    private func addPerson() {
        let names = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda", "William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica", "Thomas", "Sarah", "Charles", "Karen"]
        let user = Person(name: names.randomElement()!, age: Int.random(in: 20...70))
        people.value.append(user)
    }
    
}
