//
//  AddItem.swift
//  iExpense
//
//  Created by Ilyes Chouia on 9/1/2022.
//

import SwiftUI

struct AddItem: View {
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var type: String = "personal"
    @State private var amount: Double = 0.0
    
    let types = ["business", "personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
