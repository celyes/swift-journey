//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ilyes Chouia on 6/3/2022.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content:View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    var body: some View {
        List(fetchRequest, id :\.self) { item in
            self.content(item)
        }
    }
    
    init(by: String, startingWith: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", by, startingWith))
        self.content = content
    }
}
