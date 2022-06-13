//
//  ContentView.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-12.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut the target as close as you can to".uppercased())
                .bold()
                .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
            Text("\(game.target)")
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("hit me".uppercased()) {
                alertIsVisible = true
            }
            .alert(isPresented: $alertIsVisible) {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("Hello there"),
                             message: Text("The slider value is \(game.points(sliderValue: roundedValue))"),
                             dismissButton: .default(Text("Awesome")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
