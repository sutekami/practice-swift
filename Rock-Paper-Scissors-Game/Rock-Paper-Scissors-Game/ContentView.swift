//
//  ContentView.swift
//  Rock-Paper-Scissors-Game
//
//  Created by Mashu Giga on 2025/11/08.
//

import SwiftUI

let choices = ["グー", "チョキ", "パー"]

struct ContentView: View {
  @State private var selectedChoice = choices.randomElement()!
  @State private var mustWin = Bool.random()
  @State private var showingAlert = false

  var body: some View {
    VStack {
      Text(selectedChoice)
      Text(mustWin ? "勝ちを選んでください" : "負けを選んでください")
      HStack {
        ForEach(choices, id: \.self) { choice in
          Button(choice) {
            showingAlert = true
          }
          .alert("結果、\(choice)", isPresented: $showingAlert) {
            Button("OK") {
              selectedChoice = choices.randomElement()!
              mustWin = Bool.random()
            }
          } message: {
            Text(
              "あなたは \(choice) を選びました。\n\(isWin(choice) ? (mustWin ? "正解です！" : "不正解です。") : (choice == selectedChoice ? "引き分けです。" : (mustWin ? "不正解です。" : "正解です！")) )"
            )
          }
        }
        .padding()
      }
    }
  }

  func isWin(_ choice: String) -> Bool {
    switch (selectedChoice, choice, mustWin) {
    case ("Rock", "Paper", true), ("Paper", "Scissors", true), ("Scissors", "Rock", true):
      return true
    case ("Paper", "Rock", false), ("Scissors", "Paper", false), ("Rock", "Scissors", false):
      return true
    default:
      return false
    }
  }
}

#Preview {
  ContentView()
}
