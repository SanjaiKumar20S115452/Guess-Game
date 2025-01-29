//
//  PersonNavigationView.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 27/01/25.
//

import SwiftUI

struct PersonNavigationView: View {
    let person: Person?
    var body: some View {
        Text("Person's name is \(person?.name)")
    }
}

#Preview {
    PersonNavigationView(person: Person(name: "Sushmitha", age: 22))
}
