//
//  ContentView.swift
//  ticktickclone
//
//  Created by Albert Stanley on 05/10/20.
//  Copyright © 2020 slorop. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "checkmark.square").imageScale(.large)
            }
            
            CalendarScreen().tabItem {
                Image(systemName: "calendar").imageScale(.large)
            }
            
            Settings().tabItem {
                Image(systemName: "gear").imageScale(.large)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
