//
//  Extensions.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 26/01/25.
//

import Foundation

struct User {
    var firstName: String
    var lastName: String
    var age: Int
    var fullName: String {
        return firstName + " " + lastName
    }
    mutating func change(age: Int) {
        self.age = age
    }
    
}
 
let user = User(firstName: "Sanjai", lastName: "Mohan", age: 22)

extension User {
    var fullNameString: String {
        return firstName + " " + lastName
        
    }
}

extension String {
    var numberOfCharacters: Int {
        return self.count
    }
}

import SwiftUI
//In protocol you should use only var not let

protocol Fruit {
    var color: String {get}
    var helpsImmunity: Bool {get}
    var helpsDigestion: Bool {get}
}

protocol Food {
    func canBe() -> String
}
 
struct Orange: Food {
    let id = 1
    let firstName: String = ""
    let lastName: String = ""
    func canBe() -> String {
        return firstName + " " + lastName
    }
}
extension Orange: Fruit {
    var color: String {
        return "orange"
    }
    var helpsImmunity: Bool {
        return true
    }
    var helpsDigestion: Bool {
        return true
    }
}
let orange: Orange = Orange()
struct User2 {
    var username: String
    var email: String
    var age: Int
}
extension User2: Equatable {
    static func == (lhs: User2, rhs: User2) -> Bool {
        return lhs.username == rhs.username && lhs.email == rhs.email
    }
}
let user1 = User2(username: "Mark Zuckerberg", email: "meta2gmail.com", age: 34)
let user2 = User2(username: "Elon Musk", email: "spacex@gmail.com", age: 45)
