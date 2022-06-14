//
//  RoundedViews.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-13.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56.0, height: 56.0)
            .foregroundColor(Color("ButtonFilledForegroundColor"))
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                .preferredColorScheme(.dark)
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "100")
        }
        .preferredColorScheme(.light)
    }
}
