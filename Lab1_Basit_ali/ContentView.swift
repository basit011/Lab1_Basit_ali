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
            
           
            HStack{
                Button(action: {
                    checkAnswer(userChoice: true)
                    
                }) {
                    Text("Prime")
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    checkAnswer(userChoice: false)
                    
                }) {
                    Text("Not Prime")
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
