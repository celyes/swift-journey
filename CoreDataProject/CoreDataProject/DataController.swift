//
//  DataController.swift
//  CoreDataProject
//
//  Created by Ilyes Chouia on 18/2/2022.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Cannot load CoreData model \(error.localizedDescription)")
            }
        }
    }

}
