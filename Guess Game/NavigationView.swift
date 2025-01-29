//
//  NavigationView.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 26/01/25.
//

import SwiftUI

struct NavigationView: View {
    var person: Person?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Hey welcome here! I'm \(String(describing: person?.name))")
        Button {
            dismiss()
        } label: {
            Text("Click to dismiss")
        }
    }
}
//
//#Preview {
//    NavigationView()
//}
