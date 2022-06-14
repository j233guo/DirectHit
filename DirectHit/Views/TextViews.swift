//
//  TextViews.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-13.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .font(.footnote)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "lol this is an example")
            BigNumberText(text: "99")
            SliderNumberText(text: "100")
        }
    }
}
