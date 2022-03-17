//
//  ContentView.swift
//  Instafilter
//
//  Created by Ilyes Chouia on 7/3/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showConfirmation = false
    @State private var bgColor = Color.white
    
    var body: some View {
        Button("toggle color") {
            showConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .foregroundColor(.black)
        .background(bgColor)
        
        .confirmationDialog("Change color", isPresented: $showConfirmation) {
            Button("red") { bgColor = .red }
            Button("green") { bgColor = .green }
            Button("blue") { bgColor = .blue }
            Button("cancel", role: .cancel) {}
        } message: {
            Text("Select a new color")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
