//
//  ContentView.swift
//  WeSplit
//
//  Created by Woodrow Martyr on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                Text("Student Picked: \(selectedStudent)")
            }
        }
    }
}

#Preview {
    ContentView()
}
