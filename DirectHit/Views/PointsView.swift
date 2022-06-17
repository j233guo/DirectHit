//
//  PointsView.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-16.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10.0) {
            InstructionText(text: "The slider's value is ")
            BigNumberText(text: "\(roundedValue)")
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button {
                game.startNewRound(points: points)
                alertIsVisible = false
            } label: {
                ButtonText(text: "Start a New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(20.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
    }
}
