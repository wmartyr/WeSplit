//
//  ContentView.swift
//  WeSplit
//
//  Created by Woodrow Martyr on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused:Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var finalAmount: Double {
        return checkAmount * (100 + Double(tipPercentage)) / 100
    }
    
    var tipPerPerson: Double {
        let actualNumberOfPeople = Double(numberOfPeople + 2)
        return finalAmount / actualNumberOfPeople
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    /*
                    Picker("Tip Amount", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.navigationLink)
                     */
                }
                Section("Total Amount") {
                    Text(finalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .black)
                }
                Section("Amount per person") {
                    Text(tipPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
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
