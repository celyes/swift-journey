//
//  ContentView.swift
//  BetterRest
//
//  Created by Ilyes on 22/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var component = DateComponents()
    component.hour = 8
    component.minute = 0
    var body: some View {
        
        Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.25)
        DatePicker("Pick a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
