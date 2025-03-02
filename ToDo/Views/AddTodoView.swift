//
//  AddTodoView.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI

struct AddTodoView: View {
    // 데이터 저장소에 접근가능한 환경변수
    @Environment(\.modelContext) private var modelContext
    // 닫기 기능 환경변수
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
            }
            .navigationTitle(Text("New Todo"))
            .toolbar { // 배치) Leading: 좌측 Trailing: 우측
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let todo = TodoItem(title: title)
                        modelContext.insert(todo) // 투두 내용 담기
                        dismiss() // 모달창 닫기
                    }
                }
            }
        }
    }
}

#Preview {
    AddTodoView()
}
