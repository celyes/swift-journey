//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Ilyes Chouia on 19/1/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) { Text("Special request")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) { Text("Extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) { Text("Add sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink {
                        DetailsView(order: order)
                    } label: {
                        Text("Set Details")
                    }
                }
            }
            .navigationTitle("CupCake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
