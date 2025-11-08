//
//  ContentView.swift
//  WeSplit
//
//  Created by 儀賀真周 on 2025/11/08.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  @FocusState private var amountIsFocused: Bool
  let tipPercentagers = [10, 15, 20, 25, 0]

  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    return amountPerPerson
  }

  var totalAmount: Double {
    return totalPerPerson * Double(numberOfPeople + 2)
  }

  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField(
            "Amount", value: $checkAmount,
            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
          )
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
          .pickerStyle(.navigationLink)
        }
        Section("How much tip do you want to leave?") {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<101, id: \.self) {
              Text($0, format: .percent)
            }
          }
          .pickerStyle(.navigationLink)
        }
        Section("Amount per person") {
          Text(
            totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD")
          )
        }
        Section("Total amount") {
          Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
      }
      .navigationTitle("This is a Test")
      .toolbar {
        if amountIsFocused {
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
