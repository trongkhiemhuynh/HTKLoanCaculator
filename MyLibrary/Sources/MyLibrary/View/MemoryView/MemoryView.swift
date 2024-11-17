//
//  SwiftUIView.swift
//  
//
//  Created by Khiem Huynh on 5/9/24.
//

import SwiftUI

public struct MemoryView: View {
    public init() {}
    public var body: some View {
        ContentView()
    }
}


struct ContentView: View {
    @StateObject private var viewModel: TaskViewModel

    init() {
        let context = PersistenceController.shared.container.viewContext
        _viewModel = StateObject(wrappedValue: TaskViewModel(context: context))
    }

    @State private var newTaskName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new task", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    if !newTaskName.isEmpty {
                        viewModel.addTask(name: newTaskName)
                        newTaskName = ""
                    }
                }) {
                    Text("Add Task")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                List {
                    ForEach(viewModel.tasks, id: \.id) { task in
                        HStack {
                            Text(task.name ?? "")
                                .strikethrough(task.isCompleted)
                            Spacer()
                            Button(action: {
                                viewModel.toggleCompletion(for: task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("Task List")
            .toolbar {
                EditButton()
            }
        }
    }
}




