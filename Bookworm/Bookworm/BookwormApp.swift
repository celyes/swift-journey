//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ilyes Chouia on 10/2/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    @StateObject private var dataContorller = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContorller.container.viewContext)
        }
    }
}
