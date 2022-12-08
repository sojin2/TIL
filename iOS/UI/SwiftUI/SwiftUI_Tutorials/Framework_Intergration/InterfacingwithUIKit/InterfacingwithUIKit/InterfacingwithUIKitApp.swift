//
//  InterfacingwithUIKitApp.swift
//  InterfacingwithUIKit
//
//  Created by 김소진 on 2022/12/01.
//

import SwiftUI

@main
struct InterfacingwithUIKitApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
