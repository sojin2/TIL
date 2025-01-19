//
//  Item.swift
//  ToDoApp
//
//  Created by 김소진 on 1/19/25.
//
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.title = title
    }
}
