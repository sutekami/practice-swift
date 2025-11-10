//
//  ContentView.swift
//  WeCountryFlag
//
//  Created by Mashu Giga on 2025/11/08.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = [
    "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK",
    "Ukraine", "US",
  ].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)

  @State private var showingScore = false
  @State private var scoreTitle = ""

  var body: some View {
    ZStack {
      RadialGradient(
        stops: [
          .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
          .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
        ], center: .top, startRadius: 200, endRadius: 400
      )
      .ignoresSafeArea()
      VStack(spacing: 15) {
        Text("Tap the flag of")
          .font(.largeTitle.bold())
          .foregroundStyle(.secondary)
        VStack {
          Text(countries[correctAnswer])
            .foregroundStyle(.white)
            .font(.largeTitle.weight(.semibold))
        }

        ForEach(0..<3) { number in
          Button {
            flagTapped(number)
          } label: {
            Image(countries[number])
              .clipShape(.capsule)
              .shadow(radius: 5)
          }
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 20)
      .background(.regularMaterial)
      .clipShape(.rect(cornerRadius: 20))
      .padding()
    }
    .alert(scoreTitle, isPresented: $showingScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is ???")
        .foregroundStyle(.white)
        .font(.title.bold())
    }
  }

  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
    } else {
      scoreTitle = "Wrong"
    }

    showingScore = true
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

#Preview {
  ContentView()
}
