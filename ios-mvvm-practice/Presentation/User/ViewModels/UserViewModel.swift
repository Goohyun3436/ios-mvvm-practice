//
//  UserViewModel.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/5/25.
//

import Foundation

final class UserViewModel {
    
    var people: Observable<[Person]> = Observable([])
    var loadButtonTapped: Observable<Void> = Observable(())
    var resetButtonTapped: Observable<Void> = Observable(())
    var addButtonTapped: Observable<Void> = Observable(())
    
    init() {
        loadButtonTapped.lazyBind { _ in
            self.loadPerson()
        }
        
        resetButtonTapped.lazyBind { _ in
            
        }
        
        addButtonTapped.lazyBind { _ in
            
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
    
}
