//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Ilyes Chouia on 9/2/2022.
//

import SwiftUI

struct CheckoutView: View {
    
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
    @State var showingError = false
    @ObservedObject var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.details.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Error!", isPresented: $showingError) { } message: {
            Text("Cannot place order")
        }
    }
    
    func placeOrder() async {
        debugPrint(order.details)
        guard let encoded = try? JSONEncoder().encode(order.details) else {
            print("failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POSTi"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            print("request made")
            debugPrint(data)
            let decodedOrder = try JSONDecoder().decode(OrderStruct.self, from: data)
            debugPrint(decodedOrder)
            confirmationMessage = "Your order for \(decodedOrder.quantity)X\(OrderStruct.types[decodedOrder.type].lowercased()) has been placed"
            
            showingConfirmation = true
        } catch {
            showingError = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
