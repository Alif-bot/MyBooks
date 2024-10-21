//
//  EditBookView.swift
//  MyBooks
//
//  Created by Md Alif Hossain on 20/10/24.
//

import SwiftUI

struct EditBookView: View {
    @State private var status = Status.onShelf
    @State private var rating: Int?
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var dateAdded = Date.distantPast
    @State private var dateStarted = Date.distantPast
    @State private var dateCompleted = Date.distantPast
    var body: some View {
        HStack {
            Text("Status")
            Picker("Status", selection: $status) {
                ForEach(Status.allCases){ status in
                    Text(status.description)
                }
            }
            .buttonStyle(.bordered)
        }
        VStack(alignment: .leading) {
            GroupBox{
                LabeledContent{
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label: {
                    Text("Date added")
                }
                if status == .inProgress || status == .completed {
                    LabeledContent{
                        DatePicker("",selection: $dateStarted, displayedComponents: .date)
                    } label: {
                        Text("Date started")
                    }
                }
                if status == .completed {
                    LabeledContent{
                        DatePicker("",selection: $dateCompleted, displayedComponents: .date)
                    } label: {
                        Text("Date completed")
                    }
                }
            }
            .foregroundStyle(.secondary)
            .onChange(of: status) { oldValue, newValue in
                if newValue == .onShelf {
                    dateStarted = Date.distantPast
                    dateCompleted = Date.distantPast
                } else if newValue == .inProgress && oldValue == .completed {
                    dateCompleted = Date.distantPast
                } else if newValue == .inProgress && oldValue == .onShelf {
                    dateStarted = Date.now
                } else if newValue == .completed && oldValue == .onShelf {
                    dateCompleted = Date.now
                    dateStarted = dateAdded
                } else {
                    dateCompleted = Date.now
                }
            }
        }
    }
}

#Preview {
    EditBookView()
}
