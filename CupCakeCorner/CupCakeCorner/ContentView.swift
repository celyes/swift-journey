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
                    Picker("Select your cupcake type", selection: $order.details.type) {
                        ForEach(OrderStruct.types.indices) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper("number of cakes: \(order.details.quantity)", value: $order.details.quantity, in: 3...20)
                }
                Section {
                    Toggle(isOn: $order.details.specialRequestEnabled.animation()) { Text("Special request")
                    }
                    if order.details.specialRequestEnabled {
                        Toggle(isOn: $order.details.extraFrosting) { Text("Extra frosting")
                        }
                        Toggle(isOn: $order.details.addSprinkles) { Text("Add sprinkles")
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
