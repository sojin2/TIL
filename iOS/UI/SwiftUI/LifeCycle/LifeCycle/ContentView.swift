//
//  ContentView.swift
//  LifeCycle
//
//  Created by 김소진 on 2022/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView()) {
                Text("Hello, world!")
            }
            .onAppear{
                print("onAppear")
                
            }
            .onDisappear{
                print("onDisappear")
                
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Hello world")
        }
        .onAppear{
            print("DetailView onAppear")
            
        }
        .onDisappear{
            print("DetailView onDisappear")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
