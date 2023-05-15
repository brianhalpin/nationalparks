//
//  NationalParksApp.swift
//  NationalParks
//
//  Created by Brian Halpin on 11/05/2023.
//

import SwiftUI

@main
struct NationalParksApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
