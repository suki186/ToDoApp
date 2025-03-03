//
//  TodoDetailView.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI

struct TodoDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var item: TodoItem
    
    @State private var showEditView: Bool = false // 편집모드
    
    var body: some View {
        NavigationStack {
            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Delete") {
                            modelContext.delete(item)
                            dismiss()
                        } // 삭제
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            showEditView = true
                        } // 수정
                    }
                }
                .navigationTitle(item.title) // 제목
                .sheet(isPresented: $showEditView) {
                    EditTodoView(todo: item)
                }
        }
        
    }
}

#Preview {
    TodoDetailView(item: TodoItem(title: "TodoDatil test"))
}
