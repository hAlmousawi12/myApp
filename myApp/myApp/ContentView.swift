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
            VStack {
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Sign In")
                            .font(.title)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("offW&B"), Color.blue]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
