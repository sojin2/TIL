//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by 김소진 on 1/19/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ToDoItem.self]) // `ToDoItem.self`로 수정
    }
}
