//
//  MyToggle.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI

struct MyToggle: View {
    
    @Binding var buttonSize: CGFloat
    @Binding var buttonOffset: CGFloat
    @Binding var buttonColor: Color
    @Binding var toggled: Bool
    
    
    var body: some View {
        ZStack {
            
            
            Capsule()
                .frame(width: capsuleSize, height: capsuleSize / 2)
                .foregroundColor(buttonColor)
            ZStack{
                Capsule()
                .frame(width: buttonSize, height: (capsuleSize / 2) * 0.85)
                .foregroundColor(offWhite)
                .offset(x: buttonOffset)
                Capsule()
                    .stroke(offWhite, lineWidth: 3)
                    .clipShape(
                        Capsule()
                    )
                    .clipShape(
                        Capsule()
                    )
                    .frame(width: buttonSize, height: (capsuleSize / 2) * 0.85)
                    .foregroundColor(offWhite)
                    .offset(x: buttonOffset)
            }
                .onTapGesture {
                    toggleButton()
                }
            
        }
        .onAppear {
            buttonSize = (capsuleSize / 2) * 0.85
            buttonOffset = -capsuleSize / 4
        }
    }
    
    //MARK: - Drawing constants
    let capsuleSize: CGFloat = 50
    let offWhite = Color("offW&B")
    
    //MARK: - Functions
    func toggleButton() {
        if toggled {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                buttonSize = capsuleSize * 0.925
                buttonOffset = 0
                buttonColor = .gray
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    buttonSize = (capsuleSize / 2) * 0.85
                    buttonOffset = -capsuleSize / 4
                }
            }
            toggled.toggle()
        } else {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                buttonSize = capsuleSize * 0.925
                buttonOffset = 0
                buttonColor = Color("Primary")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    buttonSize = (capsuleSize / 2) * 0.85
                    buttonOffset = capsuleSize / 4
                }
            }
            toggled.toggle()
        }
    }
}

