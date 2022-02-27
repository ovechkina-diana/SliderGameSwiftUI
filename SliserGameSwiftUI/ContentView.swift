//
//  ContentView.swift
//  SliserGameSwiftUI
//
//  Created by Diana Ovechkina on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 50
    @State private var targetValue = Int.random(in: 0...100)
    @State private var alpha: CGFloat = 0.5
    
    @State private var alertPresented = false
    
    var body: some View {
        VStack(spacing: 10){
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack{
                Text("0")
                SliderView(currentValue: $currentValue, targetValue: $targetValue, alpha: $alpha)
                    .onChange(of: currentValue) { newValue in
                        alpha = CGFloat(Float(computerScore()) / 100)
                    }
                Text("100")
            }.padding()
            
            ButtonView(title: "Ваш результат", action: {
                alertPresented = true
            }
            ).alert("Ваш результат \(computerScore())", isPresented: $alertPresented, actions: {})
          
            ButtonView(title: "Начать заново", action: {
                targetValue = Int.random(in: 0...100)
            })
        }
    }
                    
    private func computerScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
