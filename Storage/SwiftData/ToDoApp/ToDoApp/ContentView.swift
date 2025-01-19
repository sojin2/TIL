//
//  ContentView.swift
//  ToDoApp
//
//  Created by 김소진 on 1/19/25.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var toDoItems: [ToDoItem]

    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // 할 일 추가 입력 필드
                HStack {
                    TextField("할 일 추가하기...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: addTask) {
                        Text("추가")
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()

                // 할 일 목록 표시
                List {
                    ForEach(toDoItems) { item in
                        HStack {
                            Text(item.title)
                                .strikethrough(item.isCompleted, color: .gray)
                                .foregroundColor(item.isCompleted ? .gray : .black)

                            Spacer()

                            Button(action: {
                                toggleCompletion(for: item)
                            }) {
                                Text(item.isCompleted ? "취소" : "완료")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("할 일 목록")
        }
    }

    // 새로운 할 일을 추가
    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = ToDoItem(title: newTaskTitle)
        modelContext.insert(newTask)
        newTaskTitle = "" // 입력 필드 초기화
    }

    // 완료 상태를 토글
    private func toggleCompletion(for item: ToDoItem) {
        item.isCompleted.toggle()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [ToDoItem.self], inMemory: true) // `ToDoItem.self`로 수정
}
