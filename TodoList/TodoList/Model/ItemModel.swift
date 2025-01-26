//
//  ItemModel.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-26.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
