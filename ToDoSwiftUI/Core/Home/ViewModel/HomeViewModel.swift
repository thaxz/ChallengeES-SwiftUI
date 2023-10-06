//
//  HomeViewModel.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import Foundation
import SwiftUI
import CoreData

/// View model responsible for managing tasks and interacting with Core Data.
final class HomeViewModel: ObservableObject {
    
    let manager = CoreDataManager.shared
    
    /// Published property to store the list of tasks.
    @Published var tasks: [MyTask] = []
    
    init(){
        getTasks()
    }
    
    /// Fetch
    /// Fetches tasks from Core Data and updates the `tasks`.
    func getTasks(){
        let request = NSFetchRequest<MyTask>(entityName: "MyTask")
        do {
            tasks = try manager.context.fetch(request)
        } catch {
            print("error fetching departments \(error.localizedDescription)")
        }
    }
    
    /// Create
    /// Creates a new task with the provided title and description.
    func createTask(title: String, description: String) {
        let task = MyTask(context: manager.context)
        task.id = UUID()
        task.title = title
        task.taskDescription = description
        task.dateCreated = Date()
        save()
    }
    
    /// Update
    /// Updates the title and description of the task in
    func updateTask(task: MyTask, newTitle: String, newDescription: String){
        task.title = newTitle
        task.taskDescription = newDescription
        save()
    }
    
    /// Delete
    /// Since our tasks are displayed on a list, we're using the index to delete it
    func deleteTask(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = tasks[index]
        manager.context.delete(entity)
        save()
    }
    
    func save(){
        manager.save()
        getTasks()
    }
    
}
