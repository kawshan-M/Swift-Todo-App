//
//  AddView.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewMode: ListViewModel
    @State var text: String = ""
    @State var aleartMsg: String = ""
    @State var isShowAleart: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    savedItem()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊️")
        .alert(isPresented: $isShowAleart, content: getAleart)
    }
    
    func savedItem() {
        if isTextLong() == true {
            listViewMode.addItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func isTextLong() -> Bool {
        if text.count < 3 {
            aleartMsg = "Your hew todo item must be at least 3 character long !!!"
            isShowAleart.toggle()
            return false
        }
        return true
    }
    
    func getAleart() -> Alert {
        return Alert(title: Text(aleartMsg))
    }
}

//#Preview {
//    AddView()
//}
