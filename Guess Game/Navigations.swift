//
//  Navigations.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 26/01/25.
//

import SwiftUI

struct Navigations: View {
    @State var person: Person?
    @State var showSheet: Bool = false
    @State private var showPresentationDetent = false
    @State private var showFullCover = false
    @State private var navigationPerson: Person?
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showSheet = true
                }label: {
                    Text("Click to Navigate")
                }
                Divider()
                Button {
                    showPresentationDetent = true
                }label: {
                    Text("Sheet presentation detent")
                }
                Divider()
                Button {
                    showFullCover = true
                }label: {
                    Text("Full Screen Cover")
                }
                Divider()
                NavigationLink {
                    NavigationLinkView()
                } label: {
                    Text("Navigation Link ")
                }
                Divider()
                Button {
                    navigationPerson = Person(name: "Sushmitha Vijayakumar", age: 32)
                }label: {
                    Text("Navigation destination Item")
                }

            }
            .sheet(item: $person) { person in
                NavigationView(person: person)
            }
            .sheet(isPresented: $showPresentationDetent) {
                PresentationDetentView()
                    .presentationDetents([.fraction(250)])
                    .presentationDragIndicator(.hidden)
            }
            .fullScreenCover(isPresented: $showFullCover) {
                FullScreenCover()
            }
            .navigationDestination(item: $navigationPerson) { person in
                PersonNavigationView(person: person)
            }
        }
    }
}

//#Preview {
//    Navigations()
//}
