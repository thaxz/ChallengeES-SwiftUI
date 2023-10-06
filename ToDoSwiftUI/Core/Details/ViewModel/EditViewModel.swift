//
//  EditViewModel.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 06/10/23.
//

import Foundation
import CoreData

class EditViewModel: ObservableObject {
    
    let manager = CoreDataManager.shared
    
    @Published var title: String = ""
    @Published var description: String = ""
    
    init(task: MyTask?) {
        if let task = task {
            self.title = task.title ?? ""
            self.description = task.taskDescription ?? ""
        }
    }
    
    func getTasks(){
        let request = NSFetchRequest<MyTask>(entityName: "MyTask")
        do {
           // tasks = try manager.context.fetch(request)
        } catch {
            print("error fetching departments \(error.localizedDescription)")
        }
    }
    
    /// Save
    func createTask(title: String, description: String) {
        let task = MyTask(context: manager.context)
        task.id = UUID()
        task.title = title
        task.taskDescription = description
        task.dateCreated = Date()
        save()
    }
    
    /// Update
    func updateTask(task: MyTask, newTitle: String, newDescription: String){
        task.title = newTitle
        task.taskDescription = newDescription
        save()
    }
    
    /// Save
    func save(){
        manager.save()
    }
}
