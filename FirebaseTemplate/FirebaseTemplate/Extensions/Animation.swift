//
//  Animation.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI
let lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.00))
struct AnimationScreen: View {
    @State private var numberOfTheAnimationgBall = 3
    
    var body: some View {
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack {
                HStack(alignment: .firstTextBaseline) {
                ForEach(0..<3) { i in
                    Capsule()
                        .foregroundColor((self.numberOfTheAnimationgBall == i) ? Color("PrimaryLight") : Color("PrimaryDark"))
                        .frame(width: self.ballSize, height: (self.numberOfTheAnimationgBall == i) ? self.ballSize/3 : self.ballSize)
                }
            }
            .animation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.1).speed(2))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: self.speed, repeats: true) { _ in
                    var randomNumb: Int
                    repeat {
                        randomNumb = Int.random(in: 0...2)
                    } while randomNumb == self.numberOfTheAnimationgBall
                    self.numberOfTheAnimationgBall = randomNumb
                }
        }
                Text("Loading...")
                    .font(.title)
                    .padding()
            }
        }.navigationBarHidden(true)
    }
    
    // MAKR: - Drawing Constants
    let ballSize: CGFloat = 20
    let speed: Double = 0.3

}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimationScreen()
                
            AnimationScreen()
                .preferredColorScheme(.dark)
        }
    }
}

struct Ball: View {
    let lightGradient = Gradient(colors: [Color("r"),
                                          Color("Shadow2")])
    @State private var flag = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: lightGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30).offset(x: -15, y: -15)
                .modifier(Follow(pct: self.flag ? 1 : 0, path: BallPath.createPath(in: CGRect(x: 0, y: 0, width: 100, height: 300))))
                .offset(x: -35, y: -135)
                .onAppear {
                    withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                        self.flag.toggle()
                    }
                }
        }
    }
}

struct Follow: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path
    
    var animatableData: CGFloat {
        get { return pct }
        set { pct = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let pt = percentPoint(pct)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }
    
    func percentPoint(_ percent: CGFloat) -> CGPoint {
        
        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
        
        let f = pct > 0.999 ? CGFloat(1-0.001) : pct
        let t = pct > 0.999 ? CGFloat(1) : pct + 0.001
        let tp = path.trimmedPath(from: f, to: t)
        
        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
}

struct BallPath: Shape {
    func path(in rect: CGRect) -> Path {
        return BallPath.createPath(in: rect)
    }
    
    static func createPath(in rect: CGRect) -> Path {
        
        let heightFactor = rect.size.height/8
        let midX = rect.midX
        
        var path = Path()
        
        path.move(to: CGPoint(x: midX, y: rect.minY))
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*3), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*5), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*7), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*7), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*5), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*3), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        return path
    }
}

extension Color {
    static let offWhite = Color("offW&B")
}


struct CircleFluid: Shape {
    var time: CGFloat

    func path(in rect: CGRect) -> Path {
        return (
            Path{ path in
                let curveHeight: CGFloat = 10
                let curveLength: CGFloat = 1.5
                
                path.move(to: CGPoint(x: 250, y: 500))
                path.addLine(to: CGPoint(x: 0, y: 500))
                
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1){
                    path.addLine(to:
                                    CGPoint(x: i,
                                            y: sin(((i / rect.height) + time) * curveLength * .pi) * curveHeight + rect.midY))
                }
                path.addLine(to: CGPoint(x: 250, y: 500))
            }
        )
    }
}

