//
//  TB.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//


import SwiftUI

struct TB: View {
    var color1: Color
    var color2: Color
    var color3: Color
    var color4: Color
    var color5: Color
    
    var body: some View {
        ZStack {
            BlurView(style: .systemChromeMaterial)
            
            HStack(alignment: .center) {
                
                Group {
                    Spacer()
                    NavigationLink(
                        destination: Main(),
                        label: {
                            VStack(alignment: .center) {
                                Image(systemName: "calendar")
                                    .font(.title2)
                                Text("Calendar")
                            }
                            .foregroundColor(color1)
                            
                        })
                }
                Spacer()
                NavigationLink(
                    destination: Standings(),
                    label: {
                        VStack(alignment: .center) {
                            Image(systemName: "textformat.123")
                                .font(.title2)
                            Text("Standings")
                        }.foregroundColor(color2)
                    })
                Spacer()
                NavigationLink(
                    destination: FC(),
                    label: {
                        VStack(alignment: .center) {
                            Image(systemName: "star")
                                .font(.title2)
                            Text("favorite club")
                        }.foregroundColor(color3)
                    })
                //                Spacer()
                //                NavigationLink(
                //                    destination: Store(),
                //                    label: {
                //                        VStack(alignment: .center) {
                //                            Image(systemName: "cart")
                //                                .font(.title2)
                //                            Text("Store")
                //                        }.foregroundColor(color4)
                //                    })
                Spacer()
                NavigationLink(
                    destination: Profile(),
                    label: {
                        VStack(alignment: .center) {
                            Image(systemName: "person.circle")
                                .font(.title2)
                            Text("Profile")
                        }
                        .foregroundColor(color5)
                        
                    })
                Spacer()
            }.font(.footnote)
        }
    }
}
   
