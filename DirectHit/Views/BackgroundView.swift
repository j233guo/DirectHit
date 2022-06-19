//
//  BackgroundView.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-13.
//

import SwiftUI

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack {
            Button{
                game.startNewGame()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }, label: {
                RoundedImageViewFilled(systemName: "list.dash")
            })
            .sheet(isPresented: $leaderboardIsShowing, content: {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing)
            })
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
            RingsView()
        )
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<5) {ring in
                let size = CGFloat(ring * 100)
                let opacityValue = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(colors: [Color("RingsColor").opacity(opacityValue * 0.8), Color("RingsColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
