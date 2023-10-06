//
//  EditView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct EditView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let task: MyTask
    
    @State private var titleText: String
    @State private var descriptionText: String
    
    init(task: MyTask) {
        self.task = task
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

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            EditView()
//        }
//    }
//}
