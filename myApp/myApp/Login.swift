//
//  Login.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(
                destination: Main(),
                label: {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
//                        .bold()
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.9215686275, alpha: 1)), Color(#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2862745098, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .cornerRadius(15)
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 5)
                }).padding()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
