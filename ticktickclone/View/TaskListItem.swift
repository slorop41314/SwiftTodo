//
//  TaskListItem.swift
//  ticktickclone
//
//  Created by AlbertStanley on 08/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI

struct TaskListItem: View {
    var task: TaskData
    var homeViewModel : HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack {
            NavigationLink(destination: TaskDetail(homeViewModel: homeViewModel, task: task)){
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
            HStack {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square").resizable().frame(width: 20, height: 20)
                    .onTapGesture {
                        self.homeViewModel.toggleItemStatus(item: task, context: context)
                        
                    }
                Text(task.title ?? "")
                Spacer()
            }
            .contentShape(Rectangle())
            .contextMenu {
                Button(action: {
                    self.homeViewModel.updateTask(item: task, context: context, taskDue: homeViewModel.tomorrow, title: nil, desc: nil)
                }){
                    Text("Move tomorrow")
                }
            }
        }
        
    }
}
