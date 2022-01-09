//
//  ContentView.swift
//  iExpense
//
//  Created by Ilyes Chouia on 7/1/2022.
//

import SwiftUI

struct User: Codable {
    let firstname: String
    let lastname: String
}

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showAddItemView = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name).font(.headline)
                                Text(item.type).font(.caption)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    }.onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                HStack {
                    if !expenses.items.isEmpty {
                        EditButton()
                    }
                    Button {
                        showAddItemView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddItemView) {
                        AddItem(expenses: expenses)
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
