//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

/// The main view displaying the list of tasks
struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: HomeViewModel
    
    @State var selectedTask: MyTask? = nil
    @State var showDetailView: Bool = false

    // Unique identifier used to force its recreation and update the list 
    let id = UUID()
    
    var body: some View {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                // Display an view with a message if the view is empty
                VStack {
                    if viewModel.tasks.isEmpty {
                        emptyView
                    } else {
                        List{
                            // Iterate through tasks and create navigation links for each task
                            ForEach(viewModel.tasks){ task in
                                NavigationLink {
                                    TaskDetailView(viewModel: viewModel, task: task)
                                } label: {
                                    TaskRow(task: task)
                                }
                            }
                            .onDelete(perform: viewModel.deleteTask)
                            .listRowSeparatorTint(.pink)
                            .listRowBackground(Color.clear)
                        }
                        .listStyle(.plain)
                    }
                    Spacer()
                    taskCount
                }
                .padding(.horizontal)
            }
            .id(id)
            .onAppear{
                viewModel.getTasks()
            }
            .onDisappear{
                presentationMode.wrappedValue.dismiss()
            }
            .navigationTitle("Tarefas")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddView(viewModel: viewModel)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
    }
}

// MARK: Components

extension HomeView {
    
    // A view displayed when there are no tasks.
    var emptyView: some View {
        VStack(spacing: 32){
            Image(systemName: "exclamationmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.accentColor)
            Text("Você não possui nenhuma tarefa. Clique em + para adicionar.")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.theme.title)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 100)
    }
    
    // A view displaying the count of tasks.
    var taskCount: some View {
        VStack{
            Rectangle()
                .foregroundColor(.accentColor)
                .frame(maxWidth: .infinity)
                .frame(height: 2)
                .opacity(0.5)
            Text("Tarefas: \(viewModel.tasks.count)")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.theme.title)
                .multilineTextAlignment(.center)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            //HomeView()
        }
    }
}
