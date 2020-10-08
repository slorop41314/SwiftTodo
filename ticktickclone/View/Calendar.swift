//
//  Calendar.swift
//  ticktickclone
//
//  Created by Albert Stanley on 05/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI

struct CalendarScreen: View {
//    @State var choosenDate: String = "2020-09-29"
    
    var body: some View {
        NavigationView {
            Text("Calendar Screen")
//                .navigationBarTitle(choosenDate)
                .navigationBarItems(trailing: HStack(spacing: 20) {
                    Image(systemName: "calendar")
                    Image(systemName: "ellipsis")
                })
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen()
    }
}

