//
//  DataController.swift
//  CoreDataProject
//
//  Created by Ilyes Chouia on 18/2/2022.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                return print("Cannot load CoreData model \(error.localizedDescription)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }

}
