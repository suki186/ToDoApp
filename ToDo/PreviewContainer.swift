//
//  PreviewContainer.swift
//  ToDo
//
//  Created by suki on 3/3/25.
//

import Foundation
import SwiftData

// 더미 데이터
@MainActor
class PreviewContainer {
    // 생성자 (싱글톤패턴)
    static let shared: PreviewContainer = PreviewContainer()
    
    let container: ModelContainer
    
    init() {
        let schema = Schema([
            TodoItem.self,
        ])
        // 서버에 전송하지 않고 메모리에만 상주시킴
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: true,
                                                    cloudKitDatabase: .none)
        
        do {
            // 컨테이너 생성
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertPreviewData() // 데이터 넣기
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertPreviewData() {
        let today = Date()
        let calendar = Calendar.current
        
        // 예제 데이터
        let todos: [(String, Date)] = [
            ("할 일 0", today),
            ("할 일 1", calendar.date(byAdding: .day, value: 1, to: today)!),
            ("할 일 2", calendar.date(byAdding: .day, value: 2, to: today)!),
            ("할 일 3", calendar.date(byAdding: .day, value: 3, to: today)!),
            ("할 일 4", calendar.date(byAdding: .day, value: 4, to: today)!),
            ("할 일 5", calendar.date(byAdding: .day, value: 5, to: today)!),
            ("할 일 6", calendar.date(byAdding: .day, value: 6, to: today)!),
        ]
        
        // 메인화면에 보이기
        for (title, date) in todos {
            let todo = TodoItem(title: title, createdAt: date)
            container.mainContext.insert(todo)
        }
        
        // 첫번째 todo를 완료 상태로
        if let firstTodo = try? container.mainContext.fetch(FetchDescriptor<TodoItem>()).first {
            firstTodo.isCompleted = true
        }
        
        // 변경사항 저장
        try? container.mainContext.save()
        
    }
}
