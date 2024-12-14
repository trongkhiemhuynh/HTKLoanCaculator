//
//  File.swift
//  
//
//  Created by Khiem Huynh on 21/9/24.
//

import Foundation
import CoreData

@objc(Task1)
public class Task1: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var isCompleted: Bool
}

extension Task1 {
    static func create(in context: NSManagedObjectContext, name: String) {
        let task = Task1(context: context)
        task.id = UUID()
        task.name = name
        task.isCompleted = false
    }
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task1] = []
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchTasks()
    }

    func fetchTasks() {
//        let request = Task1.fetchRequest()
        
//        @FetchRequest var resultTasks: FetchedResults<Task1>
//        tasks = Array(resultTasks)
//        do {
//            tasks = try context.fetch(request)
//        } catch {
//            print("Failed to fetch tasks: \(error)")
//        }
    }

    func addTask(name: String) {
        Task1.create(in: context, name: name)
        saveContext()
        fetchTasks()
    }

    func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            context.delete(tasks[index])
        }
        saveContext()
        fetchTasks()
    }

    func toggleCompletion(for task: Task1) {
        task.isCompleted.toggle()
        saveContext()
        fetchTasks()
    }

    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}

public struct PersistenceController {
    public static let shared = PersistenceController()

    public let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskList")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
