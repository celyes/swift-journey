//
//  DetailsView.swift
//  CupCakeCorner
//
//  Created by Ilyes Chouia on 20/1/2022.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var order: Order
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.details.name)
                TextField("Address", text: $order.details.address)
                TextField("City", text: $order.details.city)
                TextField("ZIP", text: $order.details.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(order.details.isOrderValid == false)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(order: Order())
        }
    }
}
