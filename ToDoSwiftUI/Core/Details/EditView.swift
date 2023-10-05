//
//  EditView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct EditView: View {
    let type: EditType
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16){
                    Text("Título")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.theme.title)
                Text("Descrição")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.theme.title)
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
