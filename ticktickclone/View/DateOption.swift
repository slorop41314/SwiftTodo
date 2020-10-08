//
//  DateOption.swift
//  ticktickclone
//
//  Created by Albert Stanley on 06/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI

struct DateOption: View {
    var title: String
    var onTap: () -> Void
    var body: some View {
        Button(action: onTap){
            Text(title)
        }
    }
}

