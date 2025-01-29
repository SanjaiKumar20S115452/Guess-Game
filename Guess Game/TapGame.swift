//
//  TapGame.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 25/01/25.
//

import SwiftUI

struct TapGame: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentPickIndex = 0
    @State private var targetIndex = 0
    @State private var score = 0
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    var possiblePicks = ["shiba", "cat", "fox"]
    var randomTarget: Int {
        return Int.random(in: 0..<possiblePicks.count)
    }
    enum Difficulty: Double {
        case easy = 1, medium = 0.5, hard = 0.1
        var title: String {
            switch self {
            case .easy:
                return "Easy"
            case .medium:
                return "Medium"
            case .hard:
                return "Hard"
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("TAP GAME")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color.gray)
                .padding(.bottom)
            HStack {
                Menu("Difficulty") {
                    Button(Difficulty.easy.title, action: {
                        timerRedundant(time: Difficulty.easy.rawValue)
                    })
                    Button(Difficulty.medium.title, action: {
                        timerRedundant(time: Difficulty.medium.rawValue)
                    })
                    Button(Difficulty.hard.title, action: {
                        timerRedundant(time: Difficulty.hard.rawValue)
                    })
                }
                Spacer()
                Text("Score: \(score)")
            }
            .padding()
            Image(possiblePicks[currentPickIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .onTapGesture {
                    timer.upstream.connect().cancel()
                    if currentPickIndex == targetIndex {
                        score += 1
                        alertTitle = "Success!"
                        alertMessage = "You got the correct answer!!"
                        showAlert = true
                    }else {
                        alertTitle = "Incorrect!"
                        alertMessage = "You chose the wrong answer!"
                        showAlert = false
                    }
                    showAlert = true
                }
            Text(possiblePicks[targetIndex])
                .padding(.top)
                .font(.headline)
            Text("Restart game")
        }.onReceive(timer, perform: { _ in
            changePicks()
        })
        .alert(alertTitle, isPresented: $showAlert) {
            Button {
                showAlert = false
            } label: {
                Text("OK")
            }
        } message: {
            Text(alertMessage)
        }
    }
    func changePicks() {
        if currentPickIndex == possiblePicks.count - 1 {
            currentPickIndex = 0
        } else {
            currentPickIndex += 1
        }
    }
    func timerRedundant(time: Double) {
        timer = Timer.publish(every: time, on: .main, in: .common).autoconnect()
    }
}

#Preview {
    TapGame()
}
