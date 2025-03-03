//
//  TodoListView.swift
//  ToDo
//
//  Created by suki on 3/3/25.
//

import SwiftUI
import SwiftData

// todo 목록들(List)
struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [TodoItem]
    
    var body: some View {
        List {
            ForEach(todos) { item in
                TodoRowView(item: item)
            }
            .onDelete(perform: deleteItems) // 옆으로 밀면 삭제되는
        }
    }
    
    // TodoItem 삭제
    private func deleteItems(offsets: IndexSet) {
        
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    TodoListView()
}
