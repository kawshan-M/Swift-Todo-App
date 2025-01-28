//
//  ListViewModel.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-27.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            save()
        }
    }
    let itemKey = "item_list"
    
    init(){
        getItem()
    }
    
    func getItem() {
//        let newItem = [
//            ItemModel(title: "This is the first item!", isCompleted: true),
//            ItemModel(title: "This is the second item!", isCompleted: false),
//            ItemModel(title: "This is the third item!", isCompleted: false),
//            ItemModel(title: "This is the fourth item!", isCompleted: false)
//        ]
//        items.append(contentsOf: newItem)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedData
    }
    
    func deleteItem(IndexSet: IndexSet){
        items.remove(atOffsets: IndexSet)
    }
    
    func moveItem(from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func save() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}
