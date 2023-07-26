//
//  ContentView.swift
//  TableView_SwiftUI
//
//  Created by 김소진 on 2022/11/27.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("귀여운 고양이 Section")) {
                    CustomCat(cellNum: 1)
                    CustomCat(cellNum: 2)
                    CustomCat(cellNum: 3)
                }
                Section(header: Text("Second section"),
                        footer: FooterView()) {
                    NavigationLink(destination: ArratList()) {
                        Text("친구들")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("List")
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
