//
//  HandlingUserInputApp.swift
//  HandlingUserInput
//
//  Created by 김소진 on 2022/11/28.
//

import SwiftUI

@main
struct HandlingUserInputApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
