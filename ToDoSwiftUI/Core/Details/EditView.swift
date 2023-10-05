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
    
    let type: EditType
    let task: MyTask? = nil
    
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24){
                Text("Título")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                TextField("Adicione um título", text: $titleText)
                    .padding()
                    .background(.gray.opacity(0.2))
                    
                Text("Descrição")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
                
                TextField("Adicione uma descrição", text: $descriptionText)
                    .padding()
                    .background(.gray.opacity(0.2))
                Button {
                    switch type {
                    case .add:
                        viewModel.createTask(title: titleText, description: descriptionText)
                        presentationMode.wrappedValue.dismiss()
                    case .edit:
                        print("edit task")
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
