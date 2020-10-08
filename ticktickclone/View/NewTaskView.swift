//
//  NewTaskView.swift
//  ticktickclone
//
//  Created by Albert Stanley on 06/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI
import CoreData

struct NewTaskView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    let calendar = Calendar.current
    let today = Date()
    
    //    private let calender = Calendar.current
    private let dateFormatter = DateFormatter()
    var body: some View {
        VStack {
            HStack {
                Button(action : {
                    self.homeViewModel.isNewData.toggle()
                }){
                    Image(systemName: "xmark").resizable().frame(width: 20, height: 20).padding()
                }
                Text("New Task")
                Spacer()
            }
            VStack {
                TextField("Task title", text: $homeViewModel.title).padding(.bottom, 12.0)
                TextField("Task description", text: $homeViewModel.description)
            }.padding()
            Spacer()
            HStack {
                VStack(alignment : .leading) {
                    Text("Task due in")
                    Text("\(homeViewModel.date, formatter : homeViewModel.taskDateFormat)").padding(.vertical)
                    HStack {
                        DateOption(title: "Today") {
                            self.homeViewModel.updateDate(value:today)
                        }
                        Spacer()
                        DateOption(title: "Tomorrow") {
                            self.homeViewModel.updateDate(value : calendar.date(byAdding: .day, value: 1, to: today)!)
                        }
                        Spacer()
                        DatePicker("", selection: $homeViewModel.date, displayedComponents: .date).labelsHidden()
                    }.padding(.bottom)
                    
                }
                
                Spacer()
            }.padding()
            HStack {
                Button(action : {
                    self.homeViewModel.postTaskData(context: self.context)
                }){
                    Text("Add task")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }.padding([.leading, .trailing])
                .padding(.vertical)
                .foregroundColor(.white)
                .background(AngularGradient(gradient: .init(colors: [.blue, .white]), center: .topLeading))
            }.padding(16)
        }
    }
}


