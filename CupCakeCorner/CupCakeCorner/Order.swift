//
//  Order.swift
//  CupCakeCorner
//
//  Created by Ilyes Chouia on 20/1/2022.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var address = ""
    @Published var city = ""
    @Published var zip = ""
    
    var isOrderValid: Bool {
        if name.isEmpty || address.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
}
