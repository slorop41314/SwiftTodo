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
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
            Text(task.title ?? "")
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.homeViewModel.toggleItemStatus(item: task, context: context)
        }.contextMenu {
            Button(action: {
                print("abc")
            }){
                Text("Move tomorrow")
            }
        }
    }
}
