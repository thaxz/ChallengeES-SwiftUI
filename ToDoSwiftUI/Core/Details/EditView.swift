//
//  EditView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

/// The view responsible to edit an existing task
struct EditView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let task: MyTask
    
    // State properties to store the edited title and description
    @State private var titleText: String
    @State private var descriptionText: String
    
    // Initializer to set up the view with the task and view model
    init(task: MyTask, viewModel: HomeViewModel) {
        self.task = task
        self.viewModel = viewModel
        self._titleText = State(initialValue: task.title ?? "")
        self._descriptionText = State(initialValue: task.taskDescription ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24){
                Text("Título")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                TextField("Edite o título", text: $titleText)
                    .padding()
                    .background(.gray.opacity(0.2))
                
                Text("Descrição")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                
                TextField("Edite a descrição", text: $descriptionText)
                    .padding()
                    .background(.gray.opacity(0.2))
                // Save button to update the task and dismiss the view
                Button {
                    viewModel.updateTask(task: task, newTitle: titleText, newDescription: descriptionText)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.accentColor)
                        .frame(height: 45)
                        .overlay(Text("Salvar").foregroundColor(.white))
                }
                Spacer()
            }
            .padding(24)
            .navigationTitle("Editar Tarefa")
        }
    }
}
