//
//  TaskDetailView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    let task: MyTask
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24){
                Text(task.title ?? "Not available")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.theme.title)
                Text(task.taskDescription ?? "Not available" )
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color.black)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(height: 2)
                Text("Criada em")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.theme.title)
                Text("\(task.dateCreated!)")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding(24)
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    EditView(task: task, viewModel: viewModel)
                } label: {
                    Text("EDIT")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

//struct TaskDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            TaskDetailView(task: )
//        }
//    }
//}
