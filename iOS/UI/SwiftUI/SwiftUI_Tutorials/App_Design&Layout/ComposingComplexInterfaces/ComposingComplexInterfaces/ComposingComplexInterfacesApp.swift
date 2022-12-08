//
//  ComposingComplexInterfacesApp.swift
//  ComposingComplexInterfaces
//
//  Created by 김소진 on 2022/11/29.
//

import SwiftUI

@main
struct ComposingComplexInterfacesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
