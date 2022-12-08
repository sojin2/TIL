//
//  WorkingwithUIControlsApp.swift
//  WorkingwithUIControls
//
//  Created by 김소진 on 2022/11/30.
//

import SwiftUI

@main
struct WorkingwithUIControlsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
