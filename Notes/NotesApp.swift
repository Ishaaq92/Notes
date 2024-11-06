//
//  NotesApp.swift
//  Notes
//
//  Created by Ishaaq Ahmed on 04/11/2024.
//

import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
