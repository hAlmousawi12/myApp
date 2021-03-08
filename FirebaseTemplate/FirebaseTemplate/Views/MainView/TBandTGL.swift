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
                    Text(toggled ? "Live" : "Not Live")
                        
                    MyToggle(buttonSize: $toggleSize, buttonOffset: $toggleOffset, buttonColor: $toggleColor, toggled: $toggled)
                        .shadow(color: Color.black.opacity(0.3), radius: 2.5, x: 0, y: 2.5)
                }.padding(.trailing)
                Spacer()
                TB(color1: Color("Primary"), color2: Color("Primary3ks"), color3: Color("Primary3ks"), color4: Color("Primary3ks"), color5: Color("Primary3ks"))
                    .frame(width: geometry.size.width - 20, height: 90)
                    .cornerRadius(32)
                    .padding(.horizontal, 10)
                    .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                
//                VStack {
//                    // ads will be here later
//                    Text("")
//                }
//                .frame(width: geometry.size.width, height: 50)
//                .background(Color.gray)
                
            }
        }
    }
}

