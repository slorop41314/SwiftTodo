//
//  TaskDetail.swift
//  ticktickclone
//
//  Created by AlbertStanley on 09/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI

struct TaskDetail: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var homeViewModel = HomeViewModel()
    var task : TaskData
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                Spacer()
            }
            TextField("Task title", text: $homeViewModel.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 12)
            HStack {
                Text("Description")
                Spacer()
            }
            TextField("Task description", text: $homeViewModel.description).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }.padding(16)
        .onAppear {
            self.homeViewModel.title = task.title ?? ""
            self.homeViewModel.date = task.date ?? Date()
            self.homeViewModel.description = task.desc ?? ""
            self.homeViewModel.isCompleted = task.isCompleted
        }
        .onDisappear {
            self.homeViewModel.updateTask(item: task, context: context, taskDue: self.homeViewModel.date, title: self.homeViewModel.title, desc: self.homeViewModel.description)
        }
    }
}

