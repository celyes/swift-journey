//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ilyes Chouia on 18/2/2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var startingWith = "A"
    
    var body: some View {
        VStack {
            FilteredList(by: "lastName", startingWith: startingWith) { (z) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add a singer") {
                let coldplay = Singer(context: moc)
                coldplay.firstName = "Taylor"
                coldplay.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("change filter to S") {
                startingWith = "S"
            }
            
            Button("change filter to A") {
                startingWith = "A"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
