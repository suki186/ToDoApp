//
//  ContentView.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [TodoItem]
    
    @State private var showAddTodo: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { item in
                    NavigationLink {
                        TodoDetailView(item: item)
                    } label: {
                        Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    }
                }
                .onDelete(perform: deleteItems) // 옆으로 밀면 삭제되는
            }
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
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}


