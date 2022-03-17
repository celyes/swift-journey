//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Ilyes Chouia on 18/2/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
