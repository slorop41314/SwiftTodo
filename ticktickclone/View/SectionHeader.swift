//
//  SectionHeader.swift
//  ticktickclone
//
//  Created by AlbertStanley on 08/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI


struct SectionHeader: View {
    var title: String
    var taskCount: Int
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            HStack {
                Text("\(taskCount)")
            }
        }
    }
}
