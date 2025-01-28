//
//  TodoListApp.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-25.
//

import SwiftUI

@main
struct TodoListApp: App {
     
    @StateObject var listViewMode: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewMode)
        }
    }
}
