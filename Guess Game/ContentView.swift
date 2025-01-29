//
//  ContentView.swift
//  Guess Game
//
//  Created by Sanjai Kumar on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    @State var iconImage: Image? = nil
    @State var text: String = ""
    @State var correctAnswer: Int = 0
    @State var gameMessage: String = "?"
    @State var gameSubTitle: String = ""
    @State var score: Int = 0
    var body: some View {
        VStack {
            Group {
                Text(gameMessage)
                    .font(.system(size: 40, weight: .semibold))
                Text(gameSubTitle)
                    .font(.system(size: 40, weight: .semibold))
            }
            .frame(height: 150)
            HStack {
                Text("Score: \(score)")
                    .font(.system(size: 15, weight: .semibold))
            }
            Button {
                clickButtons(number: "1")
                checkAnswer(answer: 0)
            }label: {
                Image("shiba")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            Button {
                clickButtons(number: "2")
                checkAnswer(answer: 1)
            }label: {
                Image("fox")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            Button {
                clickButtons(number: "3")
                checkAnswer(answer: 2)
            }label: {
                Image("cat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            Spacer()
        }
        .padding()
    }
    func clickButtons(number: String) {
        if number == "1" {
            iconImage = Image("shiba")
        }else if number == "2" {
            iconImage = Image("fox")
        } else if number == "3" {
            iconImage = Image("cat")
        }
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameMessage = "Success!"
        } else {
            if score != 0 {
                score -= 1
                
            }
            gameMessage = "Failed!"
        }
        if correctAnswer == 0 {
            gameSubTitle = "Correct answer is Dog"
        } else if correctAnswer == 1 {
            gameSubTitle = "Correct answer is Shiba"
        } else if correctAnswer == 2 {
            gameSubTitle = "Correct answer is Fox"
        } else {
            gameSubTitle = ""
        }
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer() {
        let randomCorrectAnswer = Int.random(in: 0..<3)
        correctAnswer = randomCorrectAnswer
    }
    
}

#Preview {
    ContentView()
}
