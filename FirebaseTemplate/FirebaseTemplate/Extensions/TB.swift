//
//  TB.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//


//import SwiftUI
//
//var tabs = ["calendar", "textformat.123", "star", "person.circle"]
//var tabsName = ["Calendar", "Standings", "Favorite club", "Profile"]
//struct TB: View {
//    @State var selectedTab = "calender"
//    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
//    var body: some View {
//
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//            TabView(selection: $selectedTab) {
//                Calender()
//                    .tag("calendar")
//                Standings()
//                    .tag("textformat.123")
//                FC()
//                    .tag("star")
//                Profile()
//                    .tag("person.circle")
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .ignoresSafeArea(.all, edges: .all)
//            HStack {
//                Spacer()
//                ForEach(0..<tabs.count) { i in
//                    TabButton(image: tabs[i], text: tabsName[i], selectedTab: $selectedTab)
//                    Spacer()
//                }
//            }
//            .padding(.horizontal, 25)
//            .padding(.vertical, 5)
//            .background(BlurView(style: .systemChromeMaterial))
//            .cornerRadius(25)
//            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
//            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct TabButton: View {
//    var image: String
//    var text: String
//    @Binding var selectedTab: String
//    var body: some View {
//        VStack {
//            Button(action: {
//                    selectedTab = image
//                }, label: {
//                    Image(systemName: image)
//
//            })
//            Text(text)
//                .font(.footnote)
//        }
//        .padding(.vertical)
//        .foregroundColor(selectedTab == image ? Color("Primary") : Color("Primary3ks"))
//    }
//}


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
   
