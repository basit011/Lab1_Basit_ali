//
//  ContentView.swift
//  Lab1_Basit_ali
//
//  Created by Basit Ali on 2025-02-11.
//


import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var correctAnswer = 0
    @State private var wrongAnswer = 0
    @State private var showResult = false
    @State private var resultMessage = ""
    @State private var attempts = 0
    @State private var showDialog = false
    @State private var Icon = ""
    @State private var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Is this Prime number?")
                .font(.largeTitle)
                .padding()
            
            Text("\(number)")
                .font(.system(size: 80, weight: .bold))
                .padding()
            
            Text(Icon)
                .font(.system(size: 50))
                .padding()
            
            HStack{
                Button(action: {
                    checkAnswer(userChoice: true)
                    
                }) {
                    Text("Prime")
                        .font(.headline)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    checkAnswer(userChoice: false)
                    
                }) {
                    Text("Not Prime")
                        .font(.headline)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            if showResult {
                Text(resultMessage)
                    .font(.title)
                    .foregroundColor(resultMessage.contains("Correct") ? .green: .red)
                    .padding()
            }
        }
        .onReceive(timer) { _ in
            recordWrongAnswer()
        }
        .alert(isPresented: $showDialog) {
            Alert(
                title: Text("Attempt Summary"),
                message: Text("✅ Correct: \(correctAnswer) \n❌ Wrong:\(wrongAnswer)"),
                dismissButton: .default(Text("Ok")))
        }
}
    func checkAnswer(userChoice: Bool) {
        if userChoice == isPrime(number) {
            correctAnswer += 1
            resultMessage = "Correct"
            Icon = "✅"
        } else {
            wrongAnswer += 1
            resultMessage = "Wrong"
            Icon = "❌"

        }
        showResult = true
        nextRound()
    }
    
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 { return false }
        }
        return true
    }
    
    func recordWrongAnswer() {
        wrongAnswer += 1
        resultMessage = "Times up!"
        Icon = "❌"
        showResult = true
        nextRound()
    }

    func nextRound() {
        attempts += 1
        if attempts % 10 == 0 {
            showDialog = true
        }
        number = Int.random(in: 1...100)
        timer.upstream.connect().cancel()       
        timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    }
}
#Preview {
    ContentView()
}
