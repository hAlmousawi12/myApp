//
//  TabBar.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Main().tabItem {
                Image(systemName: "calendar")
                Text("calender")
                    .font(.title2)
            }
            Standings().tabItem {
                Image(systemName: "textformat.123")
                Text("Standings")
                    .font(.title2)
            }
        }.accentColor(Color("Shadow2"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
