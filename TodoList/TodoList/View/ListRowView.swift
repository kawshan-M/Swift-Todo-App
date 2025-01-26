//
//  ListRowView.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

//#Preview {
//    ListRowView()
//}
