//
//  NewBookView.swift
//  MyBooks
//
//  Created by Md Alif Hossain on 9/10/24.
//

import SwiftUI

struct NewBookView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Button(action: {
                    let newBook = Book(title: title, author: author)
                    context.insert(newBook)
                    dismiss()
                }, label: {
                    Text("Create")
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .disabled(title.isEmpty || author.isEmpty)
                
            }
            .navigationTitle("New Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
