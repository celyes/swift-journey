//
//  WaterMarked.swift
//  ViewsAndModifiers
//
//  Created by Ilyes on 21/12/2021.
//

import SwiftUI

struct Watermarked: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermarked(text: text))
    }
}


