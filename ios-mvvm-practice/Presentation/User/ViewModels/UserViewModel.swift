//
//  UserViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class UserViewModel {
    
    //MAKR: - Input
    let loadButtonTapped: Observable<Void> = Observable(())
    let resetButtonTapped: Observable<Void> = Observable(())
    let addButtonTapped: Observable<Void> = Observable(())
    
    //MAKR: - Output
    let people: Observable<[Person]> = Observable([])
    
    //MAKR: - Initializer Method
    init() {
        loadButtonTapped.lazyBind { [weak self]  _ in
            self?.loadPerson()
        }
        
        resetButtonTapped.lazyBind { [weak self] _ in
            self?.resetPerson()
        }
        
        addButtonTapped.lazyBind { [weak self] _ in
            self?.addPerson()
        }
    }
    
    //MAKR: - Method
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
