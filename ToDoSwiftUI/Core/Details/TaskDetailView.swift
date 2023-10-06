//
//  TaskDetailView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    //todo: let task e ir pra edit view tipo edit e com a let task
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24){
                Text("taskTitle")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.theme.title)
                Text("taskDescription")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color.black)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(height: 2)
                Text("Criada em")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.theme.title)
                Text("dateCreation")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding(24)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("EDIT")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TaskDetailView()
        }
    }
}
