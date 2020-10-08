//
//  Home.swift
//  ticktickclone
//
//  Created by Albert Stanley on 05/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI
import Foundation

struct Home: View {
    let today = Calendar.current.startOfDay(for: Date())
    @ObservedObject var homeViewModel = HomeViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: TaskData.entity(),
        sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)],
        predicate: NSPredicate(format: "date >= %@ AND date <= %@ AND isCompleted = false",  Calendar.current.startOfDay(for: Date()) as CVarArg,  Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as CVarArg),
        animation: .spring()
    ) var taskResults: FetchedResults<TaskData>
    
    @FetchRequest(
        entity: TaskData.entity(),
        sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)],
        predicate: NSPredicate(format: "date >= %@ AND date <= %@ AND isCompleted = true",  Calendar.current.startOfDay(for: Date()) as CVarArg,  Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as CVarArg),
        animation: .spring()
    ) var finishedTaskResult: FetchedResults<TaskData>
    
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
    }
    
    
    var body: some View  {
        NavigationView{
            ZStack {
                List {
                    Section(header : SectionHeader(title: "Today", taskCount: taskResults.count)) {
                        ForEach(taskResults, id: \.self) { list in
                            TaskListItem(task: list, homeViewModel: homeViewModel)
                        }
                    }
                    Section(header : SectionHeader(title: "Completed", taskCount: finishedTaskResult.count), footer: EmptyView()) {
                        ForEach(finishedTaskResult, id: \.self) { list in
                            TaskListItem(task: list, homeViewModel: homeViewModel)
                        }
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            self.homeViewModel.isNewData.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill").resizable().frame(width: 56.0, height: 56.0, alignment: .bottomTrailing)
                        }.padding(.bottom, 16.0).padding(.trailing,16.0)
                    }
                }
                
                
            }
            .navigationBarTitle("To do")
            .navigationBarItems(
                leading: Button(action : {print("Open Drawer")}){
                    Image(systemName: "text.justify").imageScale(.large)
                },
                trailing:
                    Button(action : {print("Open Options")}){
                        Image(systemName: "ellipsis").imageScale(.large)
                    }
            ).sheet(isPresented: $homeViewModel.isNewData, content: {
                NewTaskView(homeViewModel: self.homeViewModel).environment(\.managedObjectContext, self.context)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}




