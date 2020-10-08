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
    @Published var showedListDate = Date()
    
    
    
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
    
}
