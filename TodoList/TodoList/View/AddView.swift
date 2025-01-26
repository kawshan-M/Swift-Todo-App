//
//  AddView.swift
//  TodoList
//
//  Created by Maleesha Kawshan on 2025-01-25.
//

import SwiftUI

struct AddView: View {
    
    @State var text: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray))
                    .cornerRadius(10)
                
                Button {
                    
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
    }
}

//#Preview {
//    AddView()
//}
