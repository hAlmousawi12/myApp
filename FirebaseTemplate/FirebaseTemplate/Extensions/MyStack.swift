//
//  MyStack.swift
//  myApp
//
//  Created by Hussain on 2/15/21.
//

import SwiftUI

struct MyStack: View {
    var txt1: String
    var txt2: String
    var body: some View {
        HStack {
            Text(txt1)
            Text(txt2)
            Spacer()
        }
    }
}


