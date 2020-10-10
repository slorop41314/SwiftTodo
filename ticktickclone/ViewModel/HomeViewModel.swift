//
//  HomeViewModel.swift
//  ticktickclone
//
//  Created by Albert Stanley on 06/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd, MMM YYYY"
        return formatter
    }()
    @Published var title = ""
    @Published var description = ""
    @Published var date = Date()
    @Published var isCompleted = false
    @Published var showedListDate = Date()
    
    let calendar = Calendar.current
    let today: Date
    let tomorrow: Date
    
    init() {
        self.today = Date()
        self.tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
    }
   
    
    // New data sheet
    @Published var isNewData = false
    
    func updateDate(value : Date) {
        date = value
    }
    
    func postTaskData(context : NSManagedObjectContext) {
        if (title != "" && description != ""){
            let newTask = TaskData(context: context)
            
            newTask.date = date
            newTask.title = title
            newTask.desc = description
            newTask.isCompleted = false
            
            do {
                try context.save()
                
                isNewData.toggle()
                title=""
                description=""
                date=Date()
            }catch {
                print(error)
            }
        }
    }
    
    func toggleItemStatus(item : TaskData, context: NSManagedObjectContext) {
        item.isCompleted.toggle()
        try! context.save()
    }
    
    func updateTask(item : TaskData, context: NSManagedObjectContext, taskDue: Date?, title : String?, desc : String?) {
        if let date = taskDue {
            item.date =  date
        }
        if let title = title {
            item.title = title
        }
        if let descr = desc {
            item.desc = descr
        }
        self.title=""
        description=""
        date=Date()
        try! context.save()
    }
}
