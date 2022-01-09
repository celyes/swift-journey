//
//  ContentView.swift
//  GuessFlag
//
//  Created by Ilyes on 26/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: [String] = ["Estonia", "France", "Spain", "UK", "US", "Nigeria", "Russia", "Poland", "Italy", "Ireland", "Germany"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle: String = ""
    @State private var showingScore = false
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.5), location: 0.3),
                .init(color: Color(red: 0.62, green: 0.1, blue: 0.2), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the correct flag")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(link: countries[number])
                        }
                    }
                }
                
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Your score is: \(scoreTitle)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding(20)
            
        } .alert(scoreTitle, isPresented: $showingScore) {
            
            Button("Cancel", role: .cancel) {}
            Button("Replay", action: askQuestion)
        } message: {
            Text("Your score is \(scoreTitle)")
        }
    }
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
extension View {
    func largeBlueTitle() -> some View {
        modifier(LargeBlueTitle())
    }
}
struct FlagImage: View {
    let link: String
    var body: some View {
        Image(link)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
