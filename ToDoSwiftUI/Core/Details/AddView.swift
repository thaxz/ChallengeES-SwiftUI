//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 06/10/23.
//

import SwiftUI

/// The view responsible to add an existing task
struct AddView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    // State properties to store title and description
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    // Property to control the alert presentation for empty fields
    @State private var showAlert = false
    
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
                    if titleText.isEmpty || descriptionText.isEmpty {
                        showAlert = true
                    } else {
                        viewModel.createTask(title: titleText, description: descriptionText)
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
            .navigationTitle("Adicionar Tarefa")
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Campos Vazios"),
                message: Text("Por favor, preencha todos os campos."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
