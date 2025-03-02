//
//  TodoItem.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var id: String = UUID().uuidString
    var title: String // 제목
    var isCompleted: Bool // 완료유무
    var createdAt: Date // 생성일
    
    init(title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
