//
//  HomeViewModel.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import Foundation
import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    let manager = CoreDataManager.shared
    
    @Published var tasks: [MyTask] = []
    
    init(){
        getTasks()
    }
    
    /// Fetch
    func getTasks(){
        let request = NSFetchRequest<MyTask>(entityName: "MyTask")
        do {
            tasks = try manager.context.fetch(request)
        } catch {
            print("error fetching departments \(error.localizedDescription)")
        }
    }
    
    /// Delete
    /// Since our tasks are displayed on a list, we're using the index to delete it
    func deleteTask(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = tasks[index]
        manager.context.delete(entity)
        save()
    }
    
    ///Save
    func save(){
        manager.save()
        getTasks()
    }
    
}
