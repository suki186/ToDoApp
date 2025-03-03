//
//  EditTodoView.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI

struct EditTodoView: View {
    //@Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let todo: TodoItem
    @State private var title: String = ""
    
    // 초기화 함수
    init(todo: TodoItem) {
        self.todo = todo
        self._title = State(initialValue: todo.title) // @State의 실질적인 값 할당
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
            }
            .navigationTitle(Text("Edit Todo"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        todo.title = title
                        //modelContext.insert(todo)
                        dismiss() // 자동으로 modelContext 호출
                    } // 수정 후 저장
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditTodoView(todo: TodoItem(title: "Hello world"))
}
