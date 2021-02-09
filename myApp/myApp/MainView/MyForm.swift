//
//  MyForm.swift
//  myApp
//
//  Created by Hussain on 2/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyForm: View {
    var body: some View {
        ZStack {
            Form {
                ForEach(games) { game in
                    VStack {
                        Spacer()
                        HStack {
                            Group {
                                VStack {
                                    WebImage(url: URL(string: game.THB))
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                                }
                                
                                Text(game.HG)
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text(game.MS)
                                    .font(.title)
                                Text(game.MD)
                                    .foregroundColor(.secondary)
                                Text(game.MT)
                                    .foregroundColor(.secondary)
                            }.padding(.vertical)
                            
                            Spacer()
                            
                            Group {
                                Text(game.AG)
                                    .bold()
                                VStack {
                                    WebImage(url: URL(string: game.TAB))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70)
                                }
                            }
                        }
Spacer()      }
                }
            }
        }
    }
}

