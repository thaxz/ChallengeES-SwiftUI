//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 06/10/23.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
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
                    viewModel.createTask(title: titleText, description: descriptionText)
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

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
