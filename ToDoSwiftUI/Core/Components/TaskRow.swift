//
//  TaskRow.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct TaskRow: View {
    let task: Int
    var body: some View {
        HStack(){
            VStack(alignment: .leading, spacing: 8){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.theme.title)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.secondary)
                Divider()
                    .overlay(Color.accentColor)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.accentColor)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(minHeight: 60)
        .frame(maxHeight: 80)
        .padding(.horizontal, 16)
        .background(Color.theme.background.ignoresSafeArea())
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: 1)
    }
}
