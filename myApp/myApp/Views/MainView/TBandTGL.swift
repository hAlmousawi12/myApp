//
//  TBandTGL.swift
//  myApp
//
//  Created by Hussain on 2/9/21.
//

import SwiftUI

struct TBandTGL: View {
    @State var toggleSize: CGFloat = 0
    @State var toggleOffset: CGFloat = 0
    @State var toggleColor: Color = .gray
    @Binding var toggled: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    Text(toggled ? "Live" : "")
                        
                    MyToggle(buttonSize: $toggleSize, buttonOffset: $toggleOffset, buttonColor: $toggleColor, toggled: $toggled)
                        .shadow(color: Color.black.opacity(0.3), radius: 2.5, x: 0, y: 2.5)
                        
                }.padding(.trailing)
                Spacer()
                TB(color1: Color("Shadow2"), color2: Color.secondary, color3: Color.secondary, color4: Color.secondary, color5: Color.secondary)
                    .frame(width: geometry.size.width - 20, height: 90)
                    .cornerRadius(32)
                    .padding(.horizontal, 10)
                    .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                
                
            }
        }
    }
}

