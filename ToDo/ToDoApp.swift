//
//  ToDoApp.swift
//  ToDo
//
//  Created by suki on 3/2/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: false,
                                                    cloudKitDatabase: .automatic)
        // swiftData를 cloudeKit에 연결

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
