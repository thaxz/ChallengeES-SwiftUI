//
//  TaskRow.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

/// Custom component representing a task cell in the list view.
struct TaskRow: View {
    
    // Task object to display in the cell
    let task: MyTask
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(task.title ?? "Not available")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.theme.title)
            Text(task.taskDescription ?? "Not available")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.secondary)
        }
        Spacer()
    }
}


