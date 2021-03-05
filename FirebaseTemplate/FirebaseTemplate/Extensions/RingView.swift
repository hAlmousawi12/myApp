//
//  RingView.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-31.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1: Color
    var color2: Color
    var width: CGFloat = 50
    var height: CGFloat = 50
    var percent: Double
    @Binding var show: Bool
    @Binding var EGShowed: Bool

    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 90)

        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)

            Circle()
                .trim(from: show ? CGFloat(progress) : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)

            Text("\(Int(percent))")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.EGShowed.toggle()
            }
        }
    }
}
