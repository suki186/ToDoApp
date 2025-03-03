//
//  ContentView.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var showAddTodo: Bool = false

    var body: some View {
        NavigationStack {
            TodoListView()
                .navigationTitle("Today's Todo")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: {showAddTodo = true}) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $showAddTodo) {
            AddTodoView() // Todo 생성 페이지
        }
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
