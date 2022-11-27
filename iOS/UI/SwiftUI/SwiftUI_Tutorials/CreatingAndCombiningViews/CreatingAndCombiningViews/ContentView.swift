//
//  ContentView.swift
//  CreatingAndCombiningViews
//
//  Created by 김소진 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                Text("Suwon Hwaseong")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("a beautiful palace")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    Text("Korea")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
                Divider()
                
                Text("About Suwon Hwaseong Fortress")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("where you can feel King Jeongjo's great dreams and filial piety")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
