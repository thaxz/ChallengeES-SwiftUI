//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    @State var selectedTask: MyTask? = nil
    @State var showDetailView: Bool = false
    
    var body: some View {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                VStack {
                    if viewModel.tasks.isEmpty {
                        emptyView
                    } else {
                        List{
                            ForEach(viewModel.tasks){ task in
                                TaskRow(task: task)
                                    .onTapGesture {
                                        segue(task: task)
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
            }
            .navigationTitle("Tarefas")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EditView(type: .add)
                            .environmentObject(viewModel)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
            .background(
                NavigationLink(
                    destination: DetailLoadingView(task: $selectedTask),
                                isActive: $showDetailView,
                                label: { EmptyView() })
            )
    }
    
    func segue(task: MyTask){
        selectedTask = task
        showDetailView.toggle()
    }
}

// MARK: Components

extension HomeView {
    
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
            HomeView()
        }
    }
}
