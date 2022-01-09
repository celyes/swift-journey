//
//  Expenses.swift
//  iExpense
//
//  Created by Ilyes Chouia on 9/1/2022.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var type: String
    var amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
