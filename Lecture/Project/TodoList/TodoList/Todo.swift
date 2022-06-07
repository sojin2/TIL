//
//  Todo.swift
//  TodoList
//
//  Created by joonwon lee on 2020/03/19.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit


// TODO: Codable과 Equatable 추가
// todo간에는 동등 비교가 가능해야하는데 그럴려면 Equatable 프로토콜을 따라야 한다
struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    // struct 타입인데 스스로를 업데이트 하므로 mutating
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // [x] TODO: update 로직 추가
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    // 동등함의 조건 커스텀
    static func == (lhs: Self, rhs: Self) -> Bool {
        // [x] TODO: 동등 조건 추가
        return lhs.id == rhs.id
    }
}

class TodoManager {
    
    // 싱글톤 - 하나만 만들어놓고 계속 불러다 쓰면될 때 사용
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        // [x] TODO: create로직 추가
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        // [x] TODO: add로직 추가
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
        // [x] TODO: delete 로직 추가
        
        // 데이터가 적을때 사용하기 좋음
//        if let index = todos.firstIndex(of: todo) {
//            todos.remove(at: index)
//        }
        
        // 데이터가 많을 때 사용하기 좋음
//        todos = todos.filter{ existingTodo in
//            return existingTodo.id != todo.id
//        }
        
        // 단축 문법 (큰 이슈가 아니라면 단축 문법을 사용하는게 좋음)
        todos = todos.filter { $0.id != todo.id }
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
        // [x] TODO: updatee 로직 추가
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}

class TodoViewModel {
    
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
    
    private let manager = TodoManager.shared
    
    var todos: [Todo] {
        return manager.todos
    }
    
    var todayTodos: [Todo] {
        return todos.filter { $0.isToday == true }
    }
    
    var upcompingTodos: [Todo] {
        return todos.filter { $0.isToday == false }
    }
    
    var numOfSection: Int {
        return Section.allCases.count
    }
    
    func addTodo(_ todo: Todo) {
        manager.addTodo(todo)
    }
    
    func deleteTodo(_ todo: Todo) {
        manager.deleteTodo(todo)
    }
    
    func updateTodo(_ todo: Todo) {
        manager.updateTodo(todo)
    }
    
    func loadTasks() {
        manager.retrieveTodo()
    }
}

