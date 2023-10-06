//
//  EditView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: EditViewModel
    
    let type: EditType
    var task: MyTask? = nil
    
    init(type: EditType, task: MyTask? = nil){
        self.type = type
        self.task = task
        self._viewModel = StateObject(wrappedValue: EditViewModel(task: task))
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24){
                Text("Título")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                TextField("Adicione um título", text: $viewModel.title)
                    .padding()
                    .background(.gray.opacity(0.2))
                
                Text("Descrição")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                
                TextField("Adicione uma descrição", text: $viewModel.description)
                    .padding()
                    .background(.gray.opacity(0.2))
                Button {
                    switch type {
                    case .add:
                        viewModel.createTask(title: viewModel.title, description: viewModel.description)
                        presentationMode.wrappedValue.dismiss()
                    case .edit:
                        guard let task = task else {return}
                        viewModel.updateTask(task: task, newTitle: viewModel.title, newDescription: viewModel.description)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.accentColor)
                        .frame(height: 45)
                        .overlay(Text("Salvar").foregroundColor(.white))
                }
                Spacer()
            }
            .padding(24)
            .navigationTitle(type == .add ? "Adicionar Tarefa" : "Editar Tarefa")
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            EditView(type: .add)
        }
    }
}
