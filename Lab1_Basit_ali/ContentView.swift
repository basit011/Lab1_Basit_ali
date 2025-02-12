//
//  ContentView.swift
//  Lab1_Basit_ali
//
//  Created by Basit Ali on 2025-02-11.
//


import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var correctAnswers = 0
    @State private var wrongAnswers = 0

    var body: some View {
        VStack {
            Text("Is this Prime number?")
                .font(.largeTitle)
                .padding()
            
            Text("\(number)")
                .font(.system(size: 80, weight: .bold))
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
