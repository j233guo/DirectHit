//
//  BackgroundView.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-13.
//

import SwiftUI

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button{
                game.startNewGame()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var content: String
    var body: some View {
        VStack(spacing: 5.0) {
            LabelText(text: title.uppercased())
            RoundedRectTextView(text: content)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", content: "\(game.score)")
            Spacer()
            NumberView(title: "Round", content: "\(game.round)")
        }
    }
}

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
