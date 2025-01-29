//
//  Person.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 26/01/25.
//

import Foundation

// Identifiable requires UUID()
struct Person: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let age: Int
    let date: Date = Date()
}
