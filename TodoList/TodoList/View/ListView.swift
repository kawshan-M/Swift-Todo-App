//
//  ListView.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewMode: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewMode.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewMode.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewMode.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewMode.deleteItem)
                    .onMove(perform: listViewMode.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}

