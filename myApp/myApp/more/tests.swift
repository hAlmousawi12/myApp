//
//  tests.swift
//  myApp
//
//  Created by Hussain on 2/14/21.
//

import SwiftUI

struct tests: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Text("Hello, World!")
            }.frame(width: geometry.size.width - 20)
            .background(Color("offW&B"))
            .cornerRadius(15)
            .padding(.leading, 10)
            .shadow(color: Color("Shadow").opacity(0.5), radius: 10, x: 0, y: 10)
        }
    }
}

struct tests_Previews: PreviewProvider {
    static var previews: some View {
        tests()
    }
}
