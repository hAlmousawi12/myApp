//
//  ContentView.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                NavigationLink(
                    destination: Login(),
                    label: {
                        Text("Login")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.9215686275, alpha: 1)), Color(#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2862745098, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(15)
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 5)
                    })
                
                NavigationLink(
                    destination: Register(),
                    label: {
                        Text("Register")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2862745098, alpha: 1)), Color(#colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.9215686275, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(15)
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 5)
                    })
            }.padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
            Home()
                .preferredColorScheme(.dark)
        }
    }
}
