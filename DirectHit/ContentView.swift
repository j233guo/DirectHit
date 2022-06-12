//
//  ContentView.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut the target as close as you can to".uppercased())
                .bold()
                .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
            Text("89")
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("hit me".uppercased()) {
                
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
